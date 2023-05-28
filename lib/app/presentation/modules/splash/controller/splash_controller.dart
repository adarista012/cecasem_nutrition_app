import 'package:cecasem_nutricion_app/app/domain/repositories/authentication_repository.dart';
import 'package:cecasem_nutricion_app/app/presentation/global/controllers/session_controller.dart';
import 'package:cecasem_nutricion_app/app/presentation/routes/routes.dart';
import 'package:flutter_meedu/meedu.dart';

class SplashController extends SimpleNotifier {
  final SessionController _sessionController;

  SplashController(
    this._sessionController,
  ) {
    _init();
  }
  final AuthenticationRepository _auth = Get.find();
  String? _routeName;
  String? get routeName => _routeName;

  void _init() async {
    final user = await _auth.user;
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );

    if (user != null) {
      _routeName = Routes.HOME;
      _sessionController.setUser(user);
    } else {
      _routeName = Routes.LOGIN;
    }
    notify();
  }
}
