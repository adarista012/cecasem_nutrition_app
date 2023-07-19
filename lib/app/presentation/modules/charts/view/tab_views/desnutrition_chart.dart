import 'package:cecasem_nutricion_app/app/presentation/modules/charts/controller/charts_controller.dart';
import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:cecasem_nutricion_app/app/utils/app_constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DesnutritionChart extends StatelessWidget {
  final ChartsController controller;
  const DesnutritionChart({super.key, required this.controller});

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
                Text(
                  '${AppConstants.titleDesnutrition} Promedio',
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
              child: !controller.isLoading
                  ? controller.listOfNutrition.isEmpty ||
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
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.blue,
                                  ),
                                  borderRadius: BorderRadius.circular(8)),
                              child: LineChart(
                                LineChartData(
                                  lineBarsData: [
                                    LineChartBarData(
                                      isCurved: true,
                                      color: AppColors.mainColor,
                                      barWidth: 8,
                                      isStrokeCapRound: true,
                                      dotData: const FlDotData(show: false),
                                      belowBarData: BarAreaData(show: false),
                                      spots: const [
                                        FlSpot(1, 1),
                                        FlSpot(3, 1.5),
                                        FlSpot(5, 1.4),
                                        FlSpot(7, 3.4),
                                        FlSpot(10, 2),
                                        FlSpot(12, 2.2),
                                        FlSpot(13, 1.8),
                                      ],
                                    ),
                                    LineChartBarData(
                                      isCurved: true,
                                      color: AppColors.mainColor,
                                      barWidth: 8,
                                      isStrokeCapRound: true,
                                      dotData: const FlDotData(show: false),
                                      belowBarData: BarAreaData(show: false),
                                      spots: const [
                                        FlSpot(1, 1),
                                        FlSpot(3, 1.5),
                                        FlSpot(5, 1.4),
                                        FlSpot(7, 3.4),
                                        FlSpot(10, 2),
                                        FlSpot(12, 2.2),
                                        FlSpot(13, 1.8),
                                      ],
                                    ),
                                    LineChartBarData(
                                      isCurved: true,
                                      color: AppColors.blue,
                                      barWidth: 8,
                                      isStrokeCapRound: true,
                                      dotData: const FlDotData(show: false),
                                      belowBarData: BarAreaData(show: false),
                                      spots: const [
                                        FlSpot(1, 1.5),
                                        FlSpot(5, 1.4),
                                        // FlSpot(7, 3),
                                        FlSpot(10, 2),
                                        FlSpot(12, 2.2),
                                        FlSpot(13, 1.8),
                                      ],
                                    ),
                                  ],
                                  titlesData: FlTitlesData(
                                    leftTitles: AxisTitles(
                                      // axisNameSize: 0.9,
                                      // axisNameWidget: Text('poii'),
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        getTitlesWidget: leftTitles,
                                      ),
                                    ),
                                    rightTitles: const AxisTitles(),
                                    topTitles: const AxisTitles(),
                                    bottomTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        getTitlesWidget: bottomTitleWidgets,
                                      ),
                                    ),
                                  ),
                                  borderData: FlBorderData(
                                    show: false,
                                  ),
                                  gridData: const FlGridData(
                                    show: true,
                                    drawVerticalLine: false,
                                  ),
                                  minX: 0,
                                  maxX: 14,
                                  maxY: 11,
                                  minY: 0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                'Promedio de los pesos en Kg.',
                                style: TextStyle(
                                  color: AppColors.mainColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                'Edad en años.',
                                style: TextStyle(
                                  color: AppColors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
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

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    final style = TextStyle(
      color: AppColors.blue,
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = Text('SEPT', style: style);
        break;
      case 7:
        text = Text('OCT', style: style);
        break;
      case 12:
        text = Text('DEC', style: style);
        break;
      default:
        text = const Text('');
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: AppColors.blue,
      // fontWeight: FontWeight.b,
      fontSize: 12,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text('0', style: style);
        break;
      case 2:
        text = Text('2', style: style);
        break;
      case 5:
        text = Text('5', style: style);
        break;
      case 8:
        text = Text('8', style: style);
        break;
      case 10:
        text = Text('10', style: style);
        break;
      case 11:
        text = Text('11', style: style);
        break;
      case 17:
        text = Text('17', style: style);
        break;

      default:
        text = const Text('');
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: text,
    );
  }
}
