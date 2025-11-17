import 'package:glypha/core/failure/failure.dart';
import 'package:glypha/core/services/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'auth_state.dart';

part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthState build() {
    _listenToAuthChanges();
    return const AuthState.initial();
  }

  void _listenToAuthChanges() {
    final authService = ref.watch(authServiceProvider);

    final subscription = authService.authChanges.listen(
      (user) {
        if (user != null) {
          state = AuthState.authenticated(user);
        } else {
          state = const AuthState.unauthenticated();
        }
      },
      onError: (error) {
        if (error is AuthFailure) {
          state = AuthState.error(error);
        } else {
          state = const AuthState.error(AuthFailure.serverError());
        }
      },
    );

    ref.onDispose(subscription.cancel);
  }

  Future<void> signInWithGoogle() async {
    state = const AuthState.loading(provider: LoginProvider.google);

    try {
      final authService = ref.read(authServiceProvider);
      final user = await authService.signInWithGoogle();

      if (user != null) {
        state = AuthState.authenticated(user);
      } else {
        state = const AuthState.unauthenticated();
      }
    } on AuthFailure catch (failure) {
      state = AuthState.error(failure);
    } catch (e) {
      state = const AuthState.error(AuthFailure.serverError());
    }
  }

  Future<void> signInWithApple() async {
    state = const AuthState.loading(provider: LoginProvider.apple);

    try {
      final authService = ref.read(authServiceProvider);
      final user = await authService.signInWithApple();

      state = AuthState.authenticated(user);
    } on AuthFailure catch (failure) {
      state = AuthState.error(failure);
    } catch (e) {
      state = const AuthState.error(AuthFailure.serverError());
    }
  }

  Future<void> signOut() async {
    state = const AuthState.loading();

    try {
      final authService = ref.read(authServiceProvider);
      await authService.signOut();
      state = const AuthState.unauthenticated();
    } on AuthFailure catch (failure) {
      state = AuthState.error(failure);
    } catch (e) {
      state = const AuthState.error(AuthFailure.serverError());
    }
  }

  void clearError() {
    state.whenOrNull(
      error: (_) => state = const AuthState.unauthenticated(),
    );
  }
}
