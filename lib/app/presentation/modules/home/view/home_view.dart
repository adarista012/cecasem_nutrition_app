import 'package:cecasem_nutricion_app/app/presentation/modules/home/view/widgets/my_app_bar.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/home/view/widgets/my_button.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/home/view/widgets/my_drawer.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/home/view/widgets/my_logo_container.dart';
import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:cecasem_nutricion_app/app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

import '../controller/home_provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        final controller = ref.watch(homeProvider);
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: myAppBar(),
          endDrawer: MyDrawer(controller: controller),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const MyLogoContainer(),
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  color: AppColors.white,
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppConstants.welcome,
                        style: TextStyle(
                            color: AppColors.blue,
                            fontSize: 36.0,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        controller.name ?? controller.email ?? '',
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: 20.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: Column(
                    children: [
                      MyButton(
                        function: () => router.pushNamed(
                          AppConstants.routeAddSurvey,
                        ),
                        string: AppConstants.add,
                        icon: Icons.add_circle_outline,
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      MyButton(
                        function: () => router.pushNamed(
                          AppConstants.routeCharts,
                        ),
                        string: AppConstants.headerCharts,
                        icon: Icons.bar_chart_rounded,
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      MyButton(
                        function: () => router.pushNamed(
                          AppConstants.routeSearchSurvey,
                        ),
                        string: AppConstants.search,
                        icon: Icons.search,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
