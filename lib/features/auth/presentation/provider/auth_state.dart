import 'package:edusync_hub/core/failure/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:edusync_hub/features/auth/domain/entities/user_entity.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._();

  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.authenticated(UserEntity user) = _Authenticated;
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.error(AuthFailure failure) = _Error;

  bool get isLoading => this is _Loading;
}