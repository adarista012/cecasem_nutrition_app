import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

Widget transparentTitles(double value, TitleMeta meta) {
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 4,
    child: Text(
      '$value',
      style: TextStyle(
        color: AppColors.transparent,
        // fontWeight: FontWeight.b,
        fontSize: 10,
      ),
    ),
  );
}
