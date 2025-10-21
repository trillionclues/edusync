import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:edusync_hub/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:edusync_hub/features/auth/domain/repositories/auth_repository.dart';
import 'package:edusync_hub/features/auth/domain/usecases/sign_in_with_email.dart';
import 'package:edusync_hub/features/auth/domain/usecases/sign_in_with_google.dart';
import 'package:edusync_hub/features/auth/domain/usecases/sign_out.dart';

part 'auth_providers.g.dart';

// Repository Provider
@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return ref.watch(authRepositoryImplProvider);
}

// Use Case Providers
@riverpod
SignInWithEmail signInWithEmail(SignInWithEmailRef ref) {
  return SignInWithEmail(ref.watch(authRepositoryProvider));
}

@riverpod
SignInWithGoogle signInWithGoogle(SignInWithGoogleRef ref) {
  return SignInWithGoogle(ref.watch(authRepositoryProvider));
}

@riverpod
SignOut signOut(SignOutRef ref) {
  return SignOut(ref.watch(authRepositoryProvider));
}