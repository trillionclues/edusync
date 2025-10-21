import 'package:edusync_hub/features/auth/domain/entities/user_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'auth_providers.dart';
import 'auth_state.dart';

part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthState build() {
    // Listen to auth state changes from repository
    _listenToAuthChanges();
    return const AuthState.initial();
  }

  void _listenToAuthChanges() {
    final authRepo = ref.watch(authRepositoryProvider);

    // ref.listen<Stream<UserEntity?>>(
    //       (_) => authRepo.authStateChanges,
    //       (previous, next) {
    //     // This will set up the stream listener
    //   },
    //   fireImmediately: true,
    // );

    final streamSubscription = authRepo.authStateChanges.listen((user) {
      if (user != null) {
        state = AuthState.authenticated(user);
      } else {
        state = const AuthState.unauthenticated();
      }
    });

    ref.onDispose(streamSubscription.cancel);
  }

  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    state = const AuthState.loading();

    final result = await ref.read(signInWithEmailProvider)(
      email: email,
      password: password,
    );

    result.fold(
      (failure) => state = AuthState.error(failure),
      (user) => state = AuthState.authenticated(user),
    );
  }

  Future<void> signInWithGoogle() async {
    state = const AuthState.loading();

    final result = await ref.read(signInWithGoogleProvider)();

    result.fold(
      (failure) => state = AuthState.error(failure),
      (user) => state = AuthState.authenticated(user),
    );
  }

  Future<void> signOut() async {
    state = const AuthState.loading();

    final result = await ref.read(signOutProvider)();

    result.fold(
      (failure) => state = AuthState.error(failure),
      (_) => state = const AuthState.unauthenticated(),
    );
  }

  void clearError() {
    state.whenOrNull(
      error: (_) => state = const AuthState.unauthenticated(),
    );
  }
}
