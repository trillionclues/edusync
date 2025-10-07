/// Failures are non-fatal errors and can be handled by the application.
abstract class Failure {
  Failure({required this.message});

  final String message;
}

class AuthFailure extends Failure {
  AuthFailure({required super.message});
}
