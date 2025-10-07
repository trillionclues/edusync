/// entity for an authenticated user
class User {
  const User({
    required this.id,
    required this.email,
    this.displayName,
    this.photoUrl,
  });

  const User.anonymous()
      : id = 'anonymous',
        email = 'anonymous@local',
        displayName = 'Guest',
        photoUrl = null;

  final String id;
  final String email;
  final String? displayName;
  final String? photoUrl;

  bool get isAnonymous => id == 'anonymous';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          email == other.email;

  @override
  int get hashCode => id.hashCode ^ email.hashCode;

  @override
  String toString() {
    return 'User(id: $id, email: $email, displayName: $displayName)';
  }
}
