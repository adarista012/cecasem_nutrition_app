import 'package:cecasem_nutricion_app/app/presentation/modules/charts/controller/charts_controller.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/chart_pie_data.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/container_chart.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/dropdown_container.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/fl_charts/touch_data_total.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/subtitle_chart.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/title_chart.dart';
import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:cecasem_nutricion_app/app/utils/app_constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TotalChart extends StatelessWidget {
  final ChartsController controller;
  const TotalChart({super.key, required this.controller});

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
                titleChart('${AppConstants.titleTotal} por edades'),
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
                            AppConstants.titleTotal,
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: !controller.isLoading
                  ? controller.totalChart == null ||
                          controller.totalChart!.isEmpty
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
                              PieChart(
                                PieChartData(
                                  pieTouchData: PieTouchData(
                                      enabled: true,
                                      touchCallback: touchDataTotal),
                                  sectionsSpace: 3.2,
                                  centerSpaceRadius: 0,
                                  sections: showingSections(
                                    controller.totalChart!,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 16.0,
                                left: 8.0,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      chartPieData(
                                          ' 0-2 años', AppColors.mainColor),
                                      chartPieData(
                                          ' 3-5 años', AppColors.amber),
                                      chartPieData(' 6-8 años', AppColors.grey),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Row(
                                      children: [
                                        chartPieData(
                                            ' 9-10 años', AppColors.red),
                                        chartPieData(
                                            ' 11-12 años', AppColors.blue),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                  : const CircularProgressIndicator(),
            ),
          ),
        ),
      ],
    );
  }
}
