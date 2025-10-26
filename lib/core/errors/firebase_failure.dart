import 'package:authify/core/constants/firebase_exception_codes.dart';
import 'package:authify/core/constants/firebase_failure_strings.dart';
import 'package:authify/core/errors/base_failure.dart';

class FirebaseFailure extends BaseFailure {
  const FirebaseFailure(super.message);

  factory FirebaseFailure.fromCode(String code, {String? message}) {
    switch (code) {
      case FirebaseExceptionCodes.emailAlreadyInUse:
        return const FirebaseFailure(FirebaseFailureStrings.emailInUse);

      case FirebaseExceptionCodes.invalidEmail:
        return const FirebaseFailure(FirebaseFailureStrings.invalidEmail);

      case FirebaseExceptionCodes.weakPassword:
        return const FirebaseFailure(FirebaseFailureStrings.weakPassword);

      case FirebaseExceptionCodes.userNotFound:
        return const FirebaseFailure(FirebaseFailureStrings.userNotFound);

      case FirebaseExceptionCodes.wrongPassword:
        return const FirebaseFailure(FirebaseFailureStrings.wrongPassword);

      case FirebaseExceptionCodes.userDisabled:
        return const FirebaseFailure(FirebaseFailureStrings.userDisabled);

      case FirebaseExceptionCodes.tooManyRequests:
        return const FirebaseFailure(FirebaseFailureStrings.tooManyRequests);

      case FirebaseExceptionCodes.operationNotAllowed:
        return const FirebaseFailure(FirebaseFailureStrings.operationNotAllowed);

      case FirebaseExceptionCodes.networkRequestFailed:
        return const FirebaseFailure(FirebaseFailureStrings.networkError);

      case FirebaseExceptionCodes.invalidCredential:
        return const FirebaseFailure(FirebaseFailureStrings.invalidCredential);

      case FirebaseExceptionCodes.accountExistsWithDifferentCredential:
        return const FirebaseFailure(
          FirebaseFailureStrings.accountExistsWithDifferentCredential,
        );

      case FirebaseExceptionCodes.credentialAlreadyInUse:
        return const FirebaseFailure(
          FirebaseFailureStrings.credentialAlreadyInUse,
        );

      case FirebaseExceptionCodes.requiresRecentLogin:
        return const FirebaseFailure(FirebaseFailureStrings.requiresRecentLogin);

      case FirebaseExceptionCodes.userTokenExpired:
        return const FirebaseFailure(FirebaseFailureStrings.userTokenExpired);

      default:
        return FirebaseFailure(
          message ?? FirebaseFailureStrings.authenticationFailed,
        );
    }
  }
}
