import 'package:cecasem_nutricion_app/app/presentation/global/controllers/session_controller.dart';
import 'package:flutter_meedu/meedu.dart';
import 'home_controller.dart';

final homeProvider = SimpleProvider(
  (_) => HomeController(SessionController()),
);
