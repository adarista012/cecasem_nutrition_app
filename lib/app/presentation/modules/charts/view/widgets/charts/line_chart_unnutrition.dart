import 'package:cecasem_nutricion_app/app/presentation/modules/charts/controller/charts_controller.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/utils/max_axis_y.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/fl_charts/titles_data_unnutrition.dart';
import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartUnnutrition extends StatelessWidget {
  const LineChartUnnutrition({
    super.key,
    required this.controller,
  });

  final ChartsController controller;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            color: AppColors.mainColor,
            barWidth: 4,
            isStrokeCapRound: true,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
            spots: getSpots(controller.mapOfNutrition),
          ),
          LineChartBarData(
            isCurved: true,
            color: AppColors.blue,
            barWidth: 4,
            isStrokeCapRound: true,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
            spots: getSpots(controller.mapOfUndernutrition),
          ),
        ],
        titlesData: titlesDataUnnutrition(),
        borderData: FlBorderData(
          show: false,
        ),
        gridData: const FlGridData(
          show: true,
          drawVerticalLine: true,
        ),
        minX: 1,
        maxX: 12,
        maxY: maxAxisY(
          controller.mapOfNutrition,
          controller.mapOfUndernutrition,
        ),
        minY: 0,
      ),
    );
  }
}
