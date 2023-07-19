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
                Text(
                  '${AppConstants.titleHeigth} Promedio',
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                                AppConstants.titleHeigth,
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
                                      chartsProvider.read.heightChart!),
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
        ),
      ],
    );
  }
}

BarTouchData get barTouchDta => BarTouchData(
      enabled: false,
      touchTooltipData: BarTouchTooltipData(
        tooltipBgColor: Colors.transparent,
        tooltipPadding: EdgeInsets.zero,
        tooltipMargin: 8,
        getTooltipItem: (
          BarChartGroupData group,
          int groupIndex,
          BarChartRodData rod,
          int rodIndex,
        ) {
          return BarTooltipItem(
            '${rod.toY.toStringAsFixed(2)} cm',
            TextStyle(
              color: AppColors.mainColor, fontSize: 12,
              // fontWeight: FontWeight.bold,
            ),
          );
        },
      ),
    );
