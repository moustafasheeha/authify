import 'package:authify/core/errors/base_failure.dart';

class FirebaseFailure extends BaseFailure {
  const FirebaseFailure(super.message);

  factory FirebaseFailure.fromCode(String code, {String? message}) {
    switch (code) {
      case 'email-already-in-use':
        return const FirebaseFailure('This email is already registered.');
      case 'invalid-email':
        return const FirebaseFailure('The email address is not valid.');
      case 'weak-password':
        return const FirebaseFailure(
          'Password is too weak. Use at least 6 characters.',
        );
      case 'user-not-found':
        return const FirebaseFailure('No user found for that email.');
      case 'wrong-password':
        return const FirebaseFailure('Incorrect password. Please try again.');
      case 'user-disabled':
        return const FirebaseFailure('This user account has been disabled.');
      case 'too-many-requests':
        return const FirebaseFailure('Too many attempts. Try again later.');
      case 'operation-not-allowed':
        return const FirebaseFailure(
          'This operation is not allowed. Contact support.',
        );
      case 'network-request-failed':
        return const FirebaseFailure('Network error. Check your connection.');
      case 'invalid-credential':
        return const FirebaseFailure('Invalid credentials provided.');
      case 'account-exists-with-different-credential':
        return const FirebaseFailure(
          'Account exists with different sign-in method.',
        );
      case 'credential-already-in-use':
        return const FirebaseFailure(
          'Credential already in use by another account.',
        );
      case 'requires-recent-login':
        return const FirebaseFailure('Please re-authenticate and try again.');
      case 'user-token-expired':
        return const FirebaseFailure('Session expired. Please sign in again.');
      default:
        return FirebaseFailure(
          message ?? 'Authentication failed. Please try again.',
        );
    }
  }
}
