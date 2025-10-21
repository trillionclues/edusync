import 'package:edusync_hub/features/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

extension UserModel on UserEntity {

  // convert Firebase User to UserEntity
  static UserEntity fromFirebaseUser(firebase_auth.User user) {
    return UserEntity(
      id: user.uid,
      email: user.email ?? '',
      displayName: user.displayName ?? '',
      photoUrl: user.photoURL ?? '',
      isEmailVerified: user.emailVerified,
    );
  }

  // convert to json for firestore
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'displayName': displayName,
      'photoUrl': photoUrl,
      'isEmailVerified': isEmailVerified,
      'phoneNumber': phoneNumber,
      'educationLevel': educationLevel,
      'interests': interests,
      'createdAt': createdAt?.toIso8601String(),
    };
  }

  // create from firestore document
  static UserEntity fromFireStore(Map<String, dynamic> doc) {
    return UserEntity(
      id: doc['id'] ?? '',
      email: doc['email'] ?? '',
      displayName: doc['displayName'] ?? '',
      photoUrl: doc['photoUrl'] ?? '',
      isEmailVerified: doc['isEmailVerified'] ?? false,
      phoneNumber: doc['phoneNumber'],
      educationLevel: doc['educationLevel'],
      interests: doc['interests'] != null
          ? List<String>.from(doc['interests'])
          : null,
      createdAt: doc['createdAt'] != null
          ? DateTime.parse(doc['createdAt'])
          : null,
    );
  }
}