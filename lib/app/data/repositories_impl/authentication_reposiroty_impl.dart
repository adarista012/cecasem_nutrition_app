import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:cecasem_nutricion_app/app/domain/repositories/authentication_repository.dart';
import 'package:cecasem_nutricion_app/app/domain/response/sign_in_response.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final FirebaseAuth _auth;
  User? _user;
  AuthenticationRepositoryImpl({
    required FirebaseAuth firebaseAuth,
  }) : _auth = firebaseAuth {
    _init();
  }

  void _init() {
    _auth.authStateChanges().listen((User? user) {
      if (!_completer.isCompleted) {
        _completer.complete();
      }
      _user = user;
    });
  }

  final Completer<void> _completer = Completer();
  @override
  Future<SignInResponse> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      return SignInResponse(
        null,
        user,
      );
    } on FirebaseAuthException catch (e) {
      return SignInResponse(
        stringToSignInError(e.code),
        null,
      );
    }
  }

  @override
  Future<void> signOut() {
    return _auth.signOut();
  }

  @override
  Future<User?> get user async {
    await _completer.future;
    return _user;
  }
}
