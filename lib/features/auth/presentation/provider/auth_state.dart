
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:glypha/core/failure/failure.dart';
import 'package:glypha/features/auth/domain/entities/user_entity.dart';

part 'auth_state.freezed.dart';

enum LoginProvider { none, google, apple }

@freezed
class AuthState with _$AuthState {
  const AuthState._();

  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading({@Default(LoginProvider.none) LoginProvider provider}) = _Loading;
  const factory AuthState.authenticated(UserEntity user) = _Authenticated;
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.error(AuthFailure failure) = _Error;

  bool get isLoading => this is _Loading;

  bool isLoadingProvider(LoginProvider provider) {
    return maybeWhen(
      loading: (loadingProvider) => loadingProvider == provider,
      orElse: () => false,
    );
  }
}