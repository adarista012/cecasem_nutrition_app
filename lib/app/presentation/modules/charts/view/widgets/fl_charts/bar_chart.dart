import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

List<BarChartGroupData>? barChart(List listn) {
  List<BarChartGroupData> list = [];
  for (int i = 0; i < listn.length; i++) {
    list.add(
      BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            toY: double.parse(listn[i].toString()),
            color: AppColors.mainColor,
            width: 56,
            borderRadius: BorderRadius.circular(4),
          )
        ],
        showingTooltipIndicators: [0],
      ),
    );
  }
  return list;
}
