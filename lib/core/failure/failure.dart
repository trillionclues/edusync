
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class AuthFailure with _$AuthFailure {
  const AuthFailure._();

  const factory AuthFailure.serverError() = ServerFailure;
  const factory AuthFailure.networkError() = NetworkFailure;
  const factory AuthFailure.invalidCredentials() = InvalidCredentialsFailure;
  const factory AuthFailure.emailAlreadyInUse() = EmailAlreadyInUseFailure;
  const factory AuthFailure.weakPassword() = WeakPasswordFailure;
  const factory AuthFailure.userNotFound() = UserNotFoundFailure;
  const factory AuthFailure.cancelledByUser() = CancelledByUserFailure;
  const factory AuthFailure.invalidEmail() = InvalidEmailFailure;

  String get message {
    return when(
      serverError: () => 'Server error occurred. Please try again.',
      networkError: () => 'Network error. Please check your connection.',
      invalidCredentials: () => 'Invalid email or password.',
      emailAlreadyInUse: () => 'Email is already in use.',
      weakPassword: () => 'Password is too weak.',
      userNotFound: () => 'User not found.',
      cancelledByUser: () => 'Sign in cancelled.',
      invalidEmail: () => 'Invalid email address.',
    );
  }
}