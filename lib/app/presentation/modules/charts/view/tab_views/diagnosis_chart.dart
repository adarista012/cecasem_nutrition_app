import 'package:cecasem_nutricion_app/app/presentation/modules/charts/controller/charts_controller.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/controller/charts_provider.dart';
import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:cecasem_nutricion_app/app/utils/app_constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DiagnosisChart extends StatelessWidget {
  final ChartsController controller;
  const DiagnosisChart({super.key, required this.controller});

//   @override
//   Widget build(BuildContext context) {
//     // controller.chart(
//     //   AppConstants.titleDiagnosis,
//     // );
//     return Column(
//       children: [
//         Center(
//           child: Text(
//             AppConstants.titleDiagnosis,
//             style: TextStyle(
//                 color: AppColors.mainColor, fontWeight: FontWeight.bold),
//           ),
//         ),
//       ],
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    controller.heightChart!.clear();
    controller.weigthChart!.clear();
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
                              controller.changeComunity(value!);
                              controller.switchChart(
                                AppConstants.titleDiagnosis,
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
                  ? controller.xAxis == null && controller.yAxis == null
                      ? Text(
                          'Seleccionar ${AppConstants.comunity}',
                          style: TextStyle(
                              color: AppColors.mainColor,
                              fontWeight: FontWeight.bold),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.blue,
                                  ),
                                  borderRadius: BorderRadius.circular(8)),
                              width: MediaQuery.of(context).size.width - 32,
                              height: MediaQuery.of(context).size.width - 32,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 16,
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          32,
                                      height:
                                          MediaQuery.of(context).size.width -
                                              32,
                                      child: BarChart(
                                        BarChartData(
                                            barTouchData: sbarTouchData,
                                            titlesData: stitlesData,
                                            borderData: borderData,
                                            barGroups: barGroup(),
                                            gridData:
                                                const FlGridData(show: false),
                                            maxY: 80),
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
                                          barTouchData: barTouchData,
                                          titlesData: titlesData,
                                          borderData: borderData,
                                          barGroups: barGroups(),

                                          gridData:
                                              const FlGridData(show: false),
                                          // alignment: BarChartAlignment.spaceAround,
                                          maxY: 80,
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
                        )
                  : const CircularProgressIndicator(),
            ),
          ),
        ),
      ],
    );
  }
}

List<BarChartGroupData>? barGroup() {
  List<BarChartGroupData> list = [];
  for (int i = 0; i < chartsProvider.read.listOfUndernutrition.length; i++) {
    list.add(
      BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            toY: double.parse(
                chartsProvider.read.listOfUndernutrition[i].toString()),
            gradient: _barsGradient,
            width: 24,
            borderRadius: BorderRadius.circular(4),
          ),
          // BarChartRodData(
          //   toY: double.parse(chartsProvider.read.axis[i].toString()),
          //   gradient: _barsGradient,
          //   width: 22,
          //   borderRadius: BorderRadius.circular(4),
          // )
        ],
        showingTooltipIndicators: [0],
      ),
    );
  }
  return list;
}

List<BarChartGroupData>? barGroups() {
  List<BarChartGroupData> list = [];
  for (int i = 0; i < chartsProvider.read.listOfNutrition.length; i++) {
    list.add(
      BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            toY:
                double.parse(chartsProvider.read.listOfNutrition[i].toString()),
            gradient: _barGradient,
            width: 24,
            borderRadius: BorderRadius.circular(4),
          ),
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
      colors: [AppColors.blue, AppColors.blue],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    );
LinearGradient get _barGradient => LinearGradient(
      colors: [AppColors.mainColor, AppColors.mainColor],
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
    fontSize: 12,
  );
  String text;
  switch (value.toInt()) {
    case 0:
      text = '         0-2 años';
      break;
    case 1:
      text = '         3-5 años';
      break;
    case 2:
      text = '         6-8 años';
      break;
    case 3:
      text = '         9-10 años';
      break;
    case 4:
      text = '         11-12 años';
      break;
    default:
      text = '         ';
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
    color: AppColors.blue,
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

BarTouchData get sbarTouchData => BarTouchData(
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
              color: AppColors.blue,
              fontSize: 12,
            ),
          );
        },
      ),
    );

BarTouchData get barTouchData => BarTouchData(
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
              fontSize: 12,
            ),
          );
        },
      ),
    );
