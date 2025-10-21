import 'package:dartz/dartz.dart';
import 'package:edusync_hub/core/failure/failure.dart';
import 'package:edusync_hub/features/auth/domain/entities/user_entity.dart';
import 'package:edusync_hub/features/auth/domain/repositories/auth_repository.dart';

class SignInWithEmail {
  final AuthRepository repository;

  SignInWithEmail(this.repository);

  Future<Either<AuthFailure, UserEntity>> call({
    required String email,
    required String password,
  }) async {
    return await repository.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}

