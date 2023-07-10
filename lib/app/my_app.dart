import 'package:cecasem_nutricion_app/app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

import 'presentation/routes/app_routes.dart';
import 'presentation/routes/routes.dart';
import 'utils/app_colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: router.appKey,
      title: AppConstants.kNameToTheApp,
      debugShowCheckedModeBanner: false,
      navigatorKey: router.navigatorKey,
      navigatorObservers: [
        router.observer,
      ],
      routes: appRoutes,
      initialRoute: Routes.SPLASH,
      theme: ThemeData(
        primarySwatch: AppColors.mainColor,
      ),
    );
  }
}
