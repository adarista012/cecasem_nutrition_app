import 'package:cecasem_nutricion_app/app/presentation/modules/charts/controller/charts_controller.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/controller/charts_provider.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/fl_charts/bar_chart.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/fl_charts/bar_data.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/fl_charts/border_data.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/fl_charts/label_bold.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/fl_charts/titles_data.dart';
import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:cecasem_nutricion_app/app/utils/app_constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeightChart extends StatelessWidget {
  final ChartsController controller;
  const WeightChart({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    controller.heightChart?.clear();
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Column(
              children: [
                Text(
                  '${AppConstants.titleWeight} Promedio',
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Text(
                        '${AppConstants.comunity}  ',
                        style: TextStyle(
                            color: AppColors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Expanded(
                        child: Container(
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.blue,
                              ),
                              borderRadius: BorderRadius.circular(8.0)),
                          child: DropdownButton(
                            value: controller.comunity,
                            padding: const EdgeInsets.all(8.0),
                            elevation: 16,
                            underline: Container(
                              color: AppColors.transparent,
                            ),
                            items: controller.listOfComunitys!
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value.toString()),
                              );
                            }).toList(),
                            onChanged: (value) {
                              controller.changeComunity(value!);
                              controller.switchChart(
                                AppConstants.titleWeight,
                              );
                            },
                          ),
                        ),
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
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: controller.isLoading
                  ? const CircularProgressIndicator()
                  : controller.weigthChart == null ||
                          controller.weigthChart!.isEmpty
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
                            Container(
                              width: MediaQuery.of(context).size.width - 32,
                              height: MediaQuery.of(context).size.width - 32,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                    color: AppColors.grey,
                                    width: 0.8,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.grey.withOpacity(0.6),
                                      blurRadius: 2.4,
                                      spreadRadius: 0.8,
                                      offset: const Offset(0, 1),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8)),
                              child: BarChart(
                                BarChartData(
                                    barTouchData: barTouchData(
                                      AppColors.mainColor,
                                    ),
                                    titlesData: titlesData,
                                    borderData: borderData,
                                    barGroups: barChart(
                                        chartsProvider.read.weigthChart!),
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
                                    maxY: controller
                                            .maxY(controller.weigthChart!) +
                                        32),
                              ),
                            ),
                            labelBold('Promedio de los pesos en Kg.',
                                AppColors.mainColor),
                            labelBold('Edad en años.', AppColors.blue),
                          ],
                        ),
            ),
          ),
        ),
      ],
    );
  }
}
