import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

Widget leftTitlesUnnutrition(double value, TitleMeta meta) {
  final style = TextStyle(
    color: AppColors.blue,
    // fontWeight: FontWeight.b,
    fontSize: 10,
  );
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 4,
    child: Text(
      value.round().toString(),
      style: style,
    ),
  );
}
