import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:micro_habits/core/failure/failure.dart';
import 'package:micro_habits/core/model/either.dart';
import 'package:micro_habits/domain/entities/user.dart';

/// handle all auth operations
class AuthRepository {
  AuthRepository({
    fb_auth.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
  })  : _firebaseAuth = firebaseAuth ?? fb_auth.FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn();

  final fb_auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  Stream<User> get authStateChanges {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      return firebaseUser == null
          ? const User.anonymous()
          : _userFromFirebase(firebaseUser);
    });
  }

  User get currentUser {
    final firebaseUser = _firebaseAuth.currentUser;
    return firebaseUser == null
        ? const User.anonymous()
        : _userFromFirebase(firebaseUser);
  }

  // sign in with Google
  Future<Either<Failure, User>> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return Either.right(const User.anonymous());
      }

      final googleAuth = await googleUser.authentication;
      final credential = fb_auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _firebaseAuth.signInWithCredential(
        credential,
      );

      return Either.right(_userFromFirebase(userCredential.user!));
    } catch (e) {
      return Either.left(AuthFailure(message: e.toString()));
    }
  }

  // sign in anonymously (offline)
  Future<Either<Failure, User>> signInAnonymously() async {
    try {
      final userCredential = await _firebaseAuth.signInAnonymously();
      return Either.right(_userFromFirebase(userCredential.user!));
    } catch (e) {
      return Either.left(AuthFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, void>> signOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
      ]);

      return Either.right(null);
    } catch (e) {
      if (kDebugMode) {
        print('fail silent');
      }
      return Either.left(AuthFailure(message: e.toString()));
    }
  }

  User _userFromFirebase(fb_auth.User firebaseUser) {
    return User(
      id: firebaseUser.uid,
      email: firebaseUser.email ?? 'unknown@email',
      displayName: firebaseUser.displayName,
      photoUrl: firebaseUser.photoURL,
    );
  }
}
