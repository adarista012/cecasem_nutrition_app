import 'package:firebase_auth/firebase_auth.dart';

class SignInResponse {
  final SignInError? error;
  final User? user;

  SignInResponse(this.error, this.user);
}

enum SignInError {
  accountExistsWithDifferentCredential,
  invalidCredential,
  cancelled,
  networkRequestFailed,
  userDisabled,
  userNotFound,
  wrongPassword,
  tooManyRequest,
  unknown,
}

SignInError stringToSignInError(String code) {
  switch (code) {
    case 'account-exists-with-different-credential':
      return SignInError.accountExistsWithDifferentCredential;
    case 'invalid-credential':
      return SignInError.invalidCredential;
    case 'network-request-failed':
      return SignInError.networkRequestFailed;
    case 'user-disabled':
      return SignInError.userDisabled;
    case 'user-not-found':
      return SignInError.userNotFound;
    case 'wrong-password':
      return SignInError.wrongPassword;
    case 'too-many-request':
      return SignInError.tooManyRequest;
    default:
      return SignInError.unknown;
  }
}
