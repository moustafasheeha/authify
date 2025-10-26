abstract class FirebaseFailureStrings {
  static const String emailInUse = 'This email is already registered.';
  static const String invalidEmail = 'The email address is not valid.';
  static const String weakPassword = 'Password is too weak. Use at least 6 characters.';
  static const String userNotFound = 'No user found for that email.';
  static const String wrongPassword = 'Incorrect password. Please try again.';
  static const String userDisabled = 'This user account has been disabled.';
  static const String tooManyRequests = 'Too many attempts. Try again later.';
  static const String operationNotAllowed = 'This operation is not allowed. Contact support.';
  static const String invalidCredential = 'Invalid credentials provided.';
  static const String accountExistsWithDifferentCredential =
      'Account exists with different sign-in method.';
  static const String credentialAlreadyInUse = 'Credential already in use by another account.';
  static const String requiresRecentLogin = 'Please re-authenticate and try again.';
  static const String userTokenExpired = 'Session expired. Please sign in again.';
    static const String networkError = 'Network error. Check your connection.';
  static const String authenticationFailed = 'Authentication failed. Please try again.';
}