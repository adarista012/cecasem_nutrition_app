import 'package:cecasem_nutricion_app/app/presentation/modules/charts/controller/charts_controller.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/controller/charts_provider.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/fl_charts/bar_chart_bold.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/fl_charts/bar_group_diagnosis.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/fl_charts/border_data.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/fl_charts/titles_data_bold.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/fl_charts/titles_data_diagnosis.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/fl_charts/titles_medium_data_diagnosis.dart';
import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartDiagnosis extends StatelessWidget {
  const BarChartDiagnosis({
    super.key,
    required this.controller,
  });

  final ChartsController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 32,
            height: MediaQuery.of(context).size.width - 32,
            child: BarChart(
              BarChartData(
                barTouchData: barTouchDataBold(
                  AppColors.transparent,
                ),
                titlesData: titlesMediumDataDiagnosis,
                borderData: borderData,
                barGroups: barGroupDiagnosis(
                  chartsProvider.read.listOfNutrition,
                  AppColors.transparent,
                ),
                gridData: FlGridData(
                  drawHorizontalLine: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(color: AppColors.grey, strokeWidth: 0.4);
                  },
                ),
                alignment: BarChartAlignment.spaceAround,
                maxY: controller.maxY(chartsProvider.read.listOfNutrition) + 32,
              ),
            ),
          ),
        ),
        Positioned(
          left: 12,
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 32,
            height: MediaQuery.of(context).size.width - 32,
            child: BarChart(
              BarChartData(
                barTouchData: barTouchDataBold(
                  AppColors.blue,
                ),
                titlesData: titlesDataDiagnosis,
                borderData: borderData,
                barGroups: barGroupDiagnosis(
                  chartsProvider.read.listOfUndernutrition,
                  AppColors.blue,
                ),
                alignment: BarChartAlignment.spaceAround,
                gridData: const FlGridData(
                  show: false,
                ),
                maxY: controller.maxY(
                      chartsProvider.read.listOfUndernutrition,
                    ) +
                    32,
              ),
            ),
          ),
        ),
        Positioned(
          left: -16,
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 32,
            height: MediaQuery.of(context).size.width - 32,
            child: BarChart(
              BarChartData(
                barTouchData: barTouchDataBold(AppColors.mainColor),
                titlesData: titlesDataBold,
                borderData: borderData,
                barGroups: barGroupDiagnosis(
                  chartsProvider.read.listOfNutrition,
                  AppColors.mainColor,
                ),
                alignment: BarChartAlignment.spaceAround,
                gridData: const FlGridData(show: false),
                // alignment: BarChartAlignment.spaceAround,
                maxY: controller.maxY(chartsProvider.read.listOfNutrition) + 32,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
