import 'package:cecasem_nutricion_app/app/presentation/modules/charts/controller/charts_provider.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/tab_views/unnutrition_chart.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/tab_views/diagnosis_chart.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/tab_views/heigth_chart.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/tab_views/total_chart.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/tab_views/weight_chart.dart';
import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

import '../../../../utils/app_constants.dart';

class ChartsView extends StatelessWidget {
  const ChartsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: chartsProvider.read.listOfTabs.length,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0.0,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: AppColors.mainColor,
          ),
          title: Text(
            AppConstants.headerCharts,
            style: TextStyle(
              color: AppColors.mainColor,
            ),
          ),
          bottom: chartsProvider.read.tabBar,
        ),
        body: Consumer(
          builder: (_, ref, __) {
            final controller = ref.watch(chartsProvider);
            return TabBarView(
              children: [
                WeightChart(controller: controller),
                HeigthChart(controller: controller),
                DiagnosisChart(controller: controller),
                UnNutritionChart(controller: controller),
                TotalChart(controller: controller),
              ],
            );
          },
        ),
      ),
    );
  }
}
