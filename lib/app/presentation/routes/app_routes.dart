import '../modules/charts/view/charts_view.dart';
import '../modules/search_survey/view/search_survey_view.dart';
import '../modules/add_survey/view/add_survey_view.dart';
import '../modules/login/view/login_view.dart';
import '../modules/splash/view/splash_view.dart';
import 'package:flutter/widgets.dart' show BuildContext, Widget;
import 'routes.dart';
import '../modules/home/view/home_view.dart';

/// WARNING: generated code don't modify directly
Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.HOME: (_) => const HomeView(),
    Routes.SPLASH: (_) => const SplashView(),
    Routes.LOGIN: (_) => const LoginView(),
  
    Routes.ADD_SURVEY: (_) => const AddSurveyView(),

    Routes.SEARCH_SURVEY: (_) => const SearchSurveyView(),

    Routes.CHARTS: (_) => const ChartsView(),
};
}

        
        
        