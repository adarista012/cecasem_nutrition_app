import 'package:cecasem_nutricion_app/app/presentation/modules/charts/controller/charts_controller.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/chart_bar_data.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/charts/bar_chart_diagnosis.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/container_chart.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/dropdown_container.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/subtitle_chart.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/title_chart.dart';
import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:cecasem_nutricion_app/app/utils/app_constants.dart';
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
                              BarChartDiagnosis(controller: controller),
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
