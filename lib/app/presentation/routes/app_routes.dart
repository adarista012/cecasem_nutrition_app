import '../modules/detail/view/detail_view.dart';
import '../modules/charts/view/charts_view.dart';
import '../modules/search_survey/view/search_survey_view.dart';
import '../modules/add_survey/view/add_survey_view.dart';
import '../modules/login/view/login_view.dart';
import '../modules/splash/view/splash_view.dart';
import 'package:flutter/widgets.dart' show BuildContext, Widget;
import 'routes.dart';
import '../modules/home/view/home_view.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.ADD_SURVEY: (_) => const AddSurveyView(),
    Routes.CHARTS: (_) => const ChartsView(),
    Routes.DETAIL: (_) => const DetailView(),
    Routes.HOME: (_) => const HomeView(),
    Routes.LOGIN: (_) => const LoginView(),
    Routes.SEARCH_SURVEY: (_) => const SearchSurveyView(),
    Routes.SPLASH: (_) => const SplashView(),
  };
}
