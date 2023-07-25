import 'package:cecasem_nutricion_app/app/presentation/modules/charts/controller/charts_controller.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/controller/charts_provider.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/container_chart.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/dropdown_container.dart';

import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/fl_charts/bar_chart.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/fl_charts/bar_data.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/fl_charts/border_data.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/fl_charts/label_bold.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/fl_charts/titles_data.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/subtitle_chart.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/title_chart.dart';

import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:cecasem_nutricion_app/app/utils/app_constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HeigthChart extends StatelessWidget {
  final ChartsController controller;
  const HeigthChart({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    controller.weigthChart?.clear();
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                titleChart('${AppConstants.titleHeigth} Promedio'),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      subtitleChart(AppConstants.comunity),
                      dropdownContainer(
                        controller.listOfComunitys,
                        (value) {
                          controller.changeComunity(value!);
                          controller.switchChart(
                            AppConstants.titleHeigth,
                          );
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
                : controller.heightChart == null ||
                        controller.heightChart!.isEmpty
                    ? Text(
                        'Seleccionar ${AppConstants.comunity}',
                        style: TextStyle(
                          color: AppColors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          containerChart(
                            context,
                            BarChart(
                              BarChartData(
                                barTouchData: barTouchData(
                                  AppColors.mainColor,
                                ),
                                titlesData: titlesData,
                                borderData: borderData,
                                barGroups:
                                    barChart(chartsProvider.read.heightChart!),
                                gridData: FlGridData(
                                  drawHorizontalLine: true,
                                  drawVerticalLine: false,
                                  getDrawingHorizontalLine: (value) {
                                    return FlLine(
                                        color: AppColors.grey,
                                        strokeWidth: 0.4);
                                  },
                                ),
                                alignment: BarChartAlignment.spaceAround,
                                maxY: chartsProvider.read
                                        .maxY(controller.heightChart!) +
                                    32,
                              ),
                            ),
                          ),
                          labelBold('Promedio de las tallas en cm.',
                              AppColors.mainColor),
                          labelBold('Edad en años.', AppColors.blue),
                        ],
                      ),
          ),
        ),
      ],
    );
  }
}
