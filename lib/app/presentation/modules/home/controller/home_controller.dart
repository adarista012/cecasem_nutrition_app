import 'package:cecasem_nutricion_app/app/domain/repositories/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:cecasem_nutricion_app/app/presentation/global/controllers/session_controller.dart';
import 'package:cecasem_nutricion_app/app/utils/dialogs/progress_dialog.dart';

class HomeController extends SimpleNotifier {
  final SessionController _sessionController;
  final AuthenticationRepository _auth = Get.find();
  String? _name;
  String? _email;

  String? get name => _name;
  String? get email => _email;

  HomeController(
    this._sessionController,
  ) {
    _getUser();
  }

  void logOut(BuildContext context) {
    ProgressDialog.show(context);
    _sessionController.signOut();
    notify();
  }

  void _getUser() async {
    var auth = await _auth.user;
    _name = auth!.displayName;
    _email = auth.email ?? 'Usuario';
    notify();
  }
}
