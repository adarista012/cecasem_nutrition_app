import 'package:cecasem_nutricion_app/app/presentation/modules/charts/controller/charts_controller.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/controller/charts_provider.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/fl_charts/bar_chart.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/fl_charts/bar_data.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/fl_charts/border_data.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/fl_charts/titles_data.dart';
import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartWeight extends StatelessWidget {
  const BarChartWeight({
    super.key,
    required this.controller,
  });

  final ChartsController controller;

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
          barTouchData: barTouchData(
            AppColors.mainColor,
          ),
          titlesData: titlesData,
          borderData: borderData,
          barGroups: barChart(chartsProvider.read.weigthChart!),
          gridData: FlGridData(
            drawHorizontalLine: true,
            drawVerticalLine: false,
            getDrawingHorizontalLine: (value) {
              return FlLine(color: AppColors.grey, strokeWidth: 0.4);
            },
          ),
          alignment: BarChartAlignment.spaceAround,
          maxY: controller.maxY(controller.weigthChart!) + 32),
    );
  }
}
