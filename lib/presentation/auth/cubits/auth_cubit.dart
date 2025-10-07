import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micro_habits/data/repositories/auth_repository.dart';
import 'package:micro_habits/domain/entities/user.dart';

/// state for firebase auth
class AuthState {
  const AuthState({
    required this.user,
    this.isLoading = false,
  });

  const AuthState.initial()
      : user = const User.anonymous(),
        isLoading = false;

  final User user;
  final bool isLoading;
  bool get isAuthenticated => !user.isAnonymous;

  AuthState copyWith({
    User? user,
    bool? isLoading,
  }) {
    return AuthState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

/// cubit to manage and listen to auth state changes
class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(const AuthState.initial()) {
    _init();
  }

  final AuthRepository _authRepository;
  StreamSubscription<User>? _authSubscription;

  void _init() {
    _authSubscription = _authRepository.authStateChanges.listen(
      (user) {
        emit(state.copyWith(user: user, isLoading: false));
      },
      onError: (error) {
        emit(state.copyWith(isLoading: false));
      },
    );

    final currentUser = _authRepository.currentUser;
    emit(state.copyWith(user: currentUser));
  }

  Future<void> signInWithGoogle() async {
    emit(state.copyWith(isLoading: true));
    try {
      await _authRepository.signInWithGoogle();
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> signInAnonymously() async {
    emit(state.copyWith(isLoading: true));
    try {
      await _authRepository.signInAnonymously();
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> signOut() async {
    emit(state.copyWith(isLoading: true));
    try {
      await _authRepository.signOut();
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }
}
