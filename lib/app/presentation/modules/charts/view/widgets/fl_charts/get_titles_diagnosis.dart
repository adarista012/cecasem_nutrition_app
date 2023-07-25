import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

Widget getTitlesDiagnosis(double value, TitleMeta meta) {
  final style = TextStyle(
    color: AppColors.transparent,
    fontSize: 12,
  );

  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 4,
    child: Text(
      value.toString(),
      style: style,
    ),
  );
}
