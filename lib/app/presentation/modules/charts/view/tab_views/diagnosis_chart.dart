import 'package:cecasem_nutricion_app/app/presentation/modules/charts/controller/charts_controller.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/controller/charts_provider.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/fl_charts/bar_chart_bold.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/fl_charts/border_data.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/fl_charts/titles_data_bold.dart';
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
                Text(
                  '${AppConstants.titleDiagnosis} nutricional',
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
                              if (value != null) {
                                controller.changeComunity(value);
                                controller.switchChart(
                                  AppConstants.titleDiagnosis,
                                );
                              }
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
                  : controller.listOfNutrition.isEmpty ||
                          controller.listOfUndernutrition.isEmpty
                      ? Text(
                          'Seleccionar ${AppConstants.comunity}',
                          style: TextStyle(
                              color: AppColors.blue,
                              fontWeight: FontWeight.bold),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
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
                              width: MediaQuery.of(context).size.width - 32,
                              height: MediaQuery.of(context).size.width - 32,
                              child: Stack(
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
                                          titlesData: mtitlesData,
                                          borderData: borderData,
                                          barGroups: barGroup(
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
                                    left: 16,
                                    child: Container(
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
                                          titlesData: stitlesData,
                                          borderData: borderData,
                                          barGroups: barGroup(
                                            chartsProvider
                                                .read.listOfUndernutrition,
                                            AppColors.blue,
                                          ),
                                          alignment:
                                              BarChartAlignment.spaceAround,
                                          gridData: FlGridData(
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
                                          barGroups: barGroup(
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
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                children: [
                                  Container(
                                    width: 16,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      color: AppColors.mainColor,
                                    ),
                                  ),
                                  Text(
                                    ' Sin desnutrición',
                                    style: TextStyle(
                                      color: AppColors.mainColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                children: [
                                  Container(
                                    width: 16,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      color: AppColors.blue,
                                    ),
                                  ),
                                  Text(
                                    ' Con desnutrición',
                                    style: TextStyle(
                                      color: AppColors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
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

List<BarChartGroupData> barGroup(List listN, Color color) {
  List<BarChartGroupData> list = [];
  for (int i = 0; i < listN.length; i++) {
    list.add(
      BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
              toY: double.parse(listN[i].toString()),
              width: 30,
              borderRadius: BorderRadius.circular(4),
              color: color),
        ],
        showingTooltipIndicators: [0],
      ),
    );
  }
  return list;
}

FlTitlesData get mtitlesData => const FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          getTitlesWidget: mgetTitles,
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
Widget mgetTitles(double value, TitleMeta meta) {
  final style = TextStyle(
    color: AppColors.blue,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.4,
  );
  String text;
  switch (value.toInt()) {
    case 0:
      text = '0-2 años ';
      break;
    case 1:
      text = '3-5 años ';
      break;
    case 2:
      text = '6-8 años';
      break;
    case 3:
      text = '9-10 años';
      break;
    case 4:
      text = '11-12 años';
      break;
    default:
      text = ' ';
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 4,
    child: Text(text, style: style),
  );
}

Widget getTitles(double value, TitleMeta meta) {
  final style = TextStyle(
    color: AppColors.transparent,
    fontSize: 12,
  );
  String text;
  switch (value.toInt()) {
    case 0:
      text = '0-2 años';
      break;
    case 1:
      text = '3-5 años';
      break;
    case 2:
      text = '6-8 años';
      break;
    case 3:
      text = '9-10 años';
      break;
    case 4:
      text = '11-12 años';
      break;
    default:
      text = ' ';
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 4,
    child: Text(text, style: style),
  );
}

FlTitlesData get stitlesData => const FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          getTitlesWidget: sgetTitles,
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

Widget sgetTitles(double value, TitleMeta meta) {
  final style = TextStyle(
    color: AppColors.transparent,
    fontSize: 12,
  );
  String text;
  switch (value.toInt()) {
    case 0:
      text = '';
      break;
    case 1:
      text = '';
      break;
    case 2:
      text = '';
      break;
    case 3:
      text = '';
      break;
    case 4:
      text = '';
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

BarTouchData get barTouchDatad => BarTouchData(
      enabled: false,
      touchTooltipData: BarTouchTooltipData(
        tooltipBgColor: Colors.transparent,
        tooltipPadding: EdgeInsets.zero,
        tooltipMargin: 4,
        getTooltipItem: (
          BarChartGroupData group,
          int groupIndex,
          BarChartRodData rod,
          int rodIndex,
        ) {
          return BarTooltipItem(
            '${rod.toY.round().toString()} kg',
            TextStyle(
              color: AppColors.mainColor,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          );
        },
      ),
    );
