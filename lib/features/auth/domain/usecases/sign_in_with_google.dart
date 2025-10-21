import 'package:dartz/dartz.dart';
import 'package:edusync_hub/core/failure/failure.dart';
import 'package:edusync_hub/features/auth/domain/entities/user_entity.dart';
import 'package:edusync_hub/features/auth/domain/repositories/auth_repository.dart';

class SignInWithGoogle {
  final AuthRepository repository;

  SignInWithGoogle(this.repository);

  Future<Either<AuthFailure, UserEntity>> call() async {
    return await repository.signInWithGoogle();
  }
}