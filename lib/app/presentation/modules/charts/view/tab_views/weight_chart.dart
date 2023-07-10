import 'package:cecasem_nutricion_app/app/presentation/modules/charts/controller/charts_controller.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/controller/charts_provider.dart';
import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:cecasem_nutricion_app/app/utils/app_constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeightChart extends StatelessWidget {
  final ChartsController controller;
  const WeightChart({super.key, required this.controller});

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
                Text(
                  '${AppConstants.titleWeight} Promedio',
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Comunidad    ',
                      style: TextStyle(
                        color: AppColors.blue,
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        controller.switchChart(
                          AppConstants.titleWeight,
                        );
                      },
                      minWidth: 20,
                      height: 24,
                      color: AppColors.mainColor,
                      child: Icon(
                        Icons.bar_chart_rounded,
                        color: AppColors.white,
                      ),
                    ),
                  ],
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
                  ? controller.weigthChart == null ||
                          controller.weigthChart!.isEmpty
                      ? Text(
                          '${AppConstants.titleWeight} Promedio',
                          style: TextStyle(
                              color: AppColors.mainColor,
                              fontWeight: FontWeight.bold),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AspectRatio(
                                aspectRatio: 1.6,
                                child: BarChart(
                                  BarChartData(
                                      barTouchData: barTouchData,
                                      titlesData: titlesData,
                                      borderData: borderData,
                                      barGroups: barGroups(),
                                      gridData: const FlGridData(show: false),
                                      // alignment: BarChartAlignment.spaceAround,
                                      maxY: 80),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 24.0, top: 8.0),
                              child: Text(
                                'Peso en Kg.',
                                style: TextStyle(
                                  color: AppColors.mainColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 24.0, top: 8.0),
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
}

List<BarChartGroupData>? barGroups() {
  List<BarChartGroupData> list = [];
  for (int i = 0; i < chartsProvider.read.weigthChart!.length; i++) {
    list.add(
      BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            toY: double.parse(chartsProvider.read.weigthChart![i].toString()),
            gradient: _barsGradient,
            width: 45,
            borderRadius: BorderRadius.circular(4),
          )
        ],
        showingTooltipIndicators: [0],
      ),
    );
  }
  return list;
}

FlBorderData get borderData => FlBorderData(
      show: false,
    );

LinearGradient get _barsGradient => LinearGradient(
      colors: [AppColors.blue, AppColors.mainColor],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    );

FlTitlesData get titlesData => const FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          getTitlesWidget: getTitles,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
    );

Widget getTitles(double value, TitleMeta meta) {
  final style = TextStyle(
    color: AppColors.blue,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  String text;
  switch (value.toInt()) {
    case 0:
      text = '0-2';
      break;
    case 1:
      text = '3-5';
      break;
    case 2:
      text = '6-8';
      break;
    case 3:
      text = '9-10';
      break;
    case 4:
      text = '11-12';
      break;
    default:
      text = '';
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 4,
    child: Text(text, style: style),
  );
}

BarTouchData get barTouchData => BarTouchData(
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
            rod.toY.round().toString(),
            TextStyle(
              color: AppColors.mainColor,
              fontWeight: FontWeight.bold,
            ),
          );
        },
      ),
    );
