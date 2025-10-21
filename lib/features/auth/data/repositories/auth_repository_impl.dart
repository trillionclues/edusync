import 'package:dartz/dartz.dart';
import 'package:edusync_hub/core/failure/failure.dart';
import 'package:edusync_hub/features/auth/data/models/user_model.dart';
import 'package:edusync_hub/features/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

import 'package:edusync_hub/features/auth/domain/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:stream_transform/stream_transform.dart';

part 'auth_repository_impl.g.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;
  final GoogleSignIn _googleSignIn;

  AuthRepositoryImpl(this._firebaseAuth,
      this._firestore,
      this._googleSignIn,);

  @override
  Stream<UserEntity?> get authStateChanges {
    return _firebaseAuth.authStateChanges().asyncMap((firebaseUser) async {
      if (firebaseUser == null) return null;

      final userEntity = UserModel.fromFirebaseUser(firebaseUser);

      // Check if additional user data in firestore
      final userDoc =
      await _firestore.collection('users').doc(firebaseUser.uid).get();
      if (userDoc.exists) {
        final userData = userDoc.data()!;
        return userEntity.copyWith(
          phoneNumber: userData['phoneNumber'],
          educationLevel: userData['educationLevel'],
          interests: List<String>.from(userData['interests'] ?? []),
          createdAt: userData['createdAt'] != null
              ? DateTime.parse(userData['createdAt'])
              : null,
        );
      }

      return userEntity;
    });
  }

  @override
  Future<Either<AuthFailure, UserEntity>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      final user = userCredential.user!;
      return Right(UserModel.fromFirebaseUser(user));
    } on firebase_auth.FirebaseAuthException catch (e) {
      return Left(_handleFirebaseAuthError(e));
    } catch (e) {
      return const Left(AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, UserEntity>> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return const Left(AuthFailure.cancelledByUser());
      }

      final googleAuth = await googleUser.authentication;
      final credential = firebase_auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential =
      await _firebaseAuth.signInWithCredential(credential);
      final user = userCredential.user!;

      return Right(UserModel.fromFirebaseUser(user));
    } on firebase_auth.FirebaseAuthException catch (e) {
      return Left(_handleFirebaseAuthError(e));
    } catch (e) {
      return const Left(AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, UserEntity>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String displayName,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user!;
      await user.updateDisplayName(displayName);

      // create initial user document
      await _firestore.collection('users').doc(user.uid).set({
        'id': user.uid,
        'email': email,
        'displayName': displayName,
        'isEmailVerified': false,
        'createdAt': DateTime.now().toIso8601String(),

        // additional fields will be null initially
        'phoneNumber': null,
        'educationLevel': null,
        'interests': [],
      });

      return Right(UserModel.fromFirebaseUser(user));
    } on firebase_auth.FirebaseAuthException catch (e) {
      return Left(_handleFirebaseAuthError(e));
    } catch (e) {
      return const Left(AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, void>> signOut() async {
    try {
      await _firebaseAuth.signOut();
      await _googleSignIn.signOut();
      return const Right(null);
    } catch (e) {
      return const Left(AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, void>> sendPasswordResetEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return const Right(null);
    } on firebase_auth.FirebaseAuthException catch (e) {
      return Left(_handleFirebaseAuthError(e));
    } catch (e) {
      return const Left(AuthFailure.serverError());
    }
  }

  @override
  Future<bool> needsAdditionalDetails(String userId) async {
    final userDoc = await _firestore.collection('users').doc(userId).get();
    if (!userDoc.exists) return true;

    final userData = userDoc.data()!;

    // check if required additional fields are filled
    return userData['phoneNumber'] == null ||
        userData['educationLevel'] == null ||
        (userData['interests'] as List).isEmpty;
  }

  AuthFailure _handleFirebaseAuthError(firebase_auth.FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
      case 'wrong-password':
        return const AuthFailure.invalidCredentials();
      case 'email-already-in-use':
        return const AuthFailure.emailAlreadyInUse();
      case 'weak-password':
        return const AuthFailure.weakPassword();
      case 'network-request-failed':
        return const AuthFailure.networkError();
      default:
        return const AuthFailure.serverError();
    }
  }
}

@riverpod
AuthRepositoryImpl authRepositoryImpl(AuthRepositoryImplRef ref) {
  return AuthRepositoryImpl(
    firebase_auth.FirebaseAuth.instance,
    FirebaseFirestore.instance,
    GoogleSignIn(),
  );
}