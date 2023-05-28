import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:cecasem_nutricion_app/app/presentation/global/controllers/session_controller.dart';
import 'package:cecasem_nutricion_app/app/utils/dialogs/progress_dialog.dart';

class HomeController extends SimpleNotifier {
  final SessionController _sessionController;
  HomeController(
    this._sessionController,
  );

  void logOut(BuildContext context) {
    ProgressDialog.show(context);
    _sessionController.signOut();
    notify();
  }
}
