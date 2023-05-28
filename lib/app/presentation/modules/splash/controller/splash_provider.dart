import 'package:cecasem_nutricion_app/app/presentation/global/controllers/session_controller.dart';
import 'package:flutter_meedu/meedu.dart';
import 'splash_controller.dart';

final splashProvider = SimpleProvider(
  (_) => SplashController(sessionProvider.read),
);
