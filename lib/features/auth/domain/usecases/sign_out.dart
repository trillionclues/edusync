
import 'package:dartz/dartz.dart';
import 'package:edusync_hub/core/failure/failure.dart';
import 'package:edusync_hub/features/auth/domain/repositories/auth_repository.dart';

class SignOut {
  final AuthRepository repository;

  SignOut(this.repository);

  Future<Either<AuthFailure, void>> call() async {
    return await repository.signOut();
  }
}