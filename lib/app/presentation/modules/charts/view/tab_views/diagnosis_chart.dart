import 'package:cecasem_nutricion_app/app/presentation/modules/charts/controller/charts_controller.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/controller/charts_provider.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/chart_bar_data.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/container_chart.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/dropdown_container.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/fl_charts/bar_chart_bold.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/fl_charts/bar_group_diagnosis.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/fl_charts/border_data.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/fl_charts/titles_data_bold.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/fl_charts/titles_data_diagnosis.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/fl_charts/titles_medium_data_diagnosis.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/subtitle_chart.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/title_chart.dart';
import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:cecasem_nutricion_app/app/utils/app_constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DiagnosisChart extends StatelessWidget {
  final ChartsController controller;
  const DiagnosisChart({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                titleChart('${AppConstants.titleDiagnosis} nutricional'),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                  child: Row(
                    children: [
                      subtitleChart(AppConstants.comunity),
                      dropdownContainer(
                        controller.listOfComunitys,
                        (value) {
                          if (value != null) {
                            controller.changeComunity(value);
                            controller.switchChart(
                              AppConstants.titleDiagnosis,
                            );
                          }
                        },
                        controller.comunity,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 8,
          child: Center(
            child: controller.isLoading
                ? const CircularProgressIndicator()
                : controller.listOfNutrition.isEmpty ||
                        controller.listOfUndernutrition.isEmpty
                    ? Text(
                        'Seleccionar ${AppConstants.comunity}',
                        style: TextStyle(
                            color: AppColors.blue, fontWeight: FontWeight.bold),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            containerChart(
                              context,
                              Stack(
                                children: [
                                  Positioned(
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          32,
                                      height:
                                          MediaQuery.of(context).size.width -
                                              32,
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
                                              return FlLine(
                                                  color: AppColors.grey,
                                                  strokeWidth: 0.4);
                                            },
                                          ),
                                          alignment:
                                              BarChartAlignment.spaceAround,
                                          maxY: controller.maxY(chartsProvider
                                                  .read.listOfNutrition) +
                                              32,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 12,
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          32,
                                      height:
                                          MediaQuery.of(context).size.width -
                                              32,
                                      child: BarChart(
                                        BarChartData(
                                          barTouchData: barTouchDataBold(
                                            AppColors.blue,
                                          ),
                                          titlesData: titlesDataDiagnosis,
                                          borderData: borderData,
                                          barGroups: barGroupDiagnosis(
                                            chartsProvider
                                                .read.listOfUndernutrition,
                                            AppColors.blue,
                                          ),
                                          alignment:
                                              BarChartAlignment.spaceAround,
                                          gridData: const FlGridData(
                                            show: false,
                                          ),
                                          maxY: controller.maxY(
                                                chartsProvider
                                                    .read.listOfUndernutrition,
                                              ) +
                                              32,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: -16,
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          32,
                                      height:
                                          MediaQuery.of(context).size.width -
                                              32,
                                      child: BarChart(
                                        BarChartData(
                                          barTouchData: barTouchDataBold(
                                              AppColors.mainColor),
                                          titlesData: titlesDataBold,
                                          borderData: borderData,
                                          barGroups: barGroupDiagnosis(
                                            chartsProvider.read.listOfNutrition,
                                            AppColors.mainColor,
                                          ),
                                          alignment:
                                              BarChartAlignment.spaceAround,
                                          gridData:
                                              const FlGridData(show: false),
                                          // alignment: BarChartAlignment.spaceAround,
                                          maxY: controller.maxY(chartsProvider
                                                  .read.listOfNutrition) +
                                              32,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            chartBarData(
                              'Sin desnutrición',
                              AppColors.mainColor,
                            ),
                            chartBarData(
                              'Con desnutrición',
                              AppColors.blue,
                            ),
                          ],
                        ),
                      ),
          ),
        ),
      ],
    );
  }
}
