import 'package:cecasem_nutricion_app/app/data/helpers/handle_login_response.dart';
import 'package:cecasem_nutricion_app/app/domain/repositories/authentication_repository.dart';
import 'package:cecasem_nutricion_app/app/presentation/global/controllers/session_controller.dart';
import 'package:cecasem_nutricion_app/app/utils/dialogs/progress_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';
import 'login_state.dart';

class LoginController extends StateNotifier<LoginState> {
  bool _emailError = false;
  bool _passwordError = false;

  bool get emailError => _emailError;
  bool get passwordError => _passwordError;

  final AuthenticationRepository _authRepository = Get.find();
  final SessionController _sessionController;

  LoginController(this._sessionController) : super(LoginState.initialState);

  void onEmailChanged(String email) {
    _emailError = false;
    if (email.isEmpty) _emailError = true;
    state = state.copyWith(email: email.trim());
  }

  void onPasswordChanged(String password) {
    _passwordError = false;
    if (password.isEmpty || password.length < 6) _passwordError = true;
    state = state.copyWith(password: password.trim());
  }

  void sendRequest(BuildContext controller) async {
    if (!_emailError &&
        !_passwordError &&
        state.email != '' &&
        state.password != '') {
      ProgressDialog.show(controller);
      final response = await _authRepository.signInWithEmailAndPassword(
        state.email,
        state.password,
      );
      if (response.error == null) {
        _sessionController.setUser(response.user!);
      }
      router.pop();
      // ignore: use_build_context_synchronously
      handleLoginResponse(
        controller,
        response,
      );
    }
  }
}
