import 'package:cecasem_nutricion_app/app/presentation/modules/charts/controller/charts_controller.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/fl_charts/touch_data_total.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartTotal extends StatelessWidget {
  const PieChartTotal({
    super.key,
    required this.controller,
  });

  final ChartsController controller;

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        pieTouchData:
            PieTouchData(enabled: true, touchCallback: touchDataTotal),
        sectionsSpace: 3.2,
        centerSpaceRadius: 0,
        sections: showingSections(
          controller.totalChart!,
        ),
      ),
    );
  }
}
