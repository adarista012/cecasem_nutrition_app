import 'package:cecasem_nutricion_app/app/presentation/global/controllers/session_controller.dart';
import 'package:flutter_meedu/meedu.dart';
import 'login_controller.dart';
import 'login_state.dart';

final loginProvider = StateProvider<LoginController, LoginState>(
  (_) => LoginController(sessionProvider.read),
);
