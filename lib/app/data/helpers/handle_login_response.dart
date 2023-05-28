import 'package:cecasem_nutricion_app/app/domain/response/sign_in_response.dart';
import 'package:cecasem_nutricion_app/app/presentation/routes/routes.dart';
import 'package:cecasem_nutricion_app/app/utils/dialogs/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

void handleLoginResponse(BuildContext context, SignInResponse response) {
  String errorMessage = '';
  if (response.error == SignInError.cancelled) {
    router.pop();
  } else if (response.error == SignInError.userDisabled) {
    Dialogs.alert(
      context,
      title: 'Error',
      content: 'Usuario deshabilitado',
    );
  } else {
    if (response.error != null) {
      switch (response.error) {
        case SignInError.accountExistsWithDifferentCredential:
          errorMessage = 'La cuenta existe con otros credenciales';
          break;
        case SignInError.invalidCredential:
          errorMessage = 'Credenciales inválidos';
          break;
        case SignInError.networkRequestFailed:
          errorMessage = 'Error de red';
          break;
        case SignInError.userNotFound:
          errorMessage = 'Usuario no encontrado';
          break;
        case SignInError.wrongPassword:
          errorMessage = 'Contraseña incorrecta';
          break;
        case SignInError.tooManyRequest:
          errorMessage = 'Límite de intentos';
          break;
        default:
          errorMessage = 'Error no encontrado';
          break;
      }
      Dialogs.alert(
        context,
        title: 'Error',
        content: errorMessage,
      );
    } else {
      router.pushNamedAndRemoveUntil(
        Routes.HOME,
      );
    }
  }
}
