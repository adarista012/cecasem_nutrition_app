import 'package:cecasem_nutricion_app/app/presentation/modules/splash/controller/splash_controller.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/splash/controller/splash_provider.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/splash/utils/logo_container.dart';
import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: ProviderListener<SplashController>(
        provider: splashProvider,
        onChange: (_, notifier) {
          final routeName = notifier.routeName;
          if (routeName != null) {
            router.pushReplacementNamed(
              routeName,
              transition: Transition.fadeIn,
              transitionDuration: const Duration(
                seconds: 1,
              ),
            );
          }
        },
        builder: (_, __) {
          return logoContainer(width);
        },
      ),
    );
  }
}
