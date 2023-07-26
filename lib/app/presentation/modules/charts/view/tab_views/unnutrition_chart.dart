import 'package:cecasem_nutricion_app/app/presentation/modules/charts/controller/charts_controller.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/chart_line_data.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/charts/line_chart_unnutrition.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/container_chart.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/dropdown_container.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/subtitle_chart.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/title_chart.dart';
import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:cecasem_nutricion_app/app/utils/app_constants.dart';
import 'package:flutter/material.dart';

class UnNutritionChart extends StatelessWidget {
  final ChartsController controller;
  const UnNutritionChart({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Column(
              children: [
                titleChart('${AppConstants.titleUnNutrition} Promedio'),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                  child: Row(
                    children: [
                      subtitleChart(AppConstants.comunity),
                      dropdownContainer(
                        controller.listOfComunitys,
                        (value) {
                          controller.changeComunity(value!);
                          controller.switchChart(
                            AppConstants.titleUnNutrition,
                          );
                        },
                        controller.comunity,
                      )
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
            child: !controller.isLoading
                ? controller.mapOfNutrition.isEmpty ||
                        controller.mapOfUndernutrition.isEmpty
                    ? Text(
                        'Seleccionar ${AppConstants.comunity}',
                        style: TextStyle(
                          color: AppColors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            containerChart(
                              context,
                              LineChartUnnutrition(controller: controller),
                            ),
                            chartLineData(
                              'Sin desnutrición',
                              AppColors.mainColor,
                            ),
                            chartLineData(
                              'Con desnutrición',
                              AppColors.blue,
                            ),
                          ],
                        ),
                      )
                : const CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }
}
