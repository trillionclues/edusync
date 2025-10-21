import 'package:dartz/dartz.dart';
import 'package:edusync_hub/core/failure/failure.dart';
import 'package:edusync_hub/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Stream<UserEntity?> get authStateChanges;

  Future<Either<AuthFailure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<AuthFailure, UserEntity>> signInWithGoogle();

  Future<Either<AuthFailure, UserEntity>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String displayName,
  });

  Future<Either<AuthFailure, void>> signOut();

  Future<Either<AuthFailure, void>> sendPasswordResetEmail(String email);

  Future<bool> needsAdditionalDetails(String userId);
}
