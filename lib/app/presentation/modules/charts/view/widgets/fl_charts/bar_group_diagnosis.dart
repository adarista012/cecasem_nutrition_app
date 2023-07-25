import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

List<BarChartGroupData> barGroupDiagnosis(List listN, Color color) {
  List<BarChartGroupData> list = [];
  for (int i = 0; i < listN.length; i++) {
    list.add(
      BarChartGroupData(
        barsSpace: 24,
        x: i,
        barRods: [
          BarChartRodData(
              toY: double.parse(listN[i].toString()),
              width: 24,
              borderRadius: BorderRadius.circular(4),
              color: color),
        ],
        showingTooltipIndicators: [0],
      ),
    );
  }
  return list;
}
