import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

Widget bottomTitles(double value, TitleMeta meta) {
  final style = TextStyle(
    color: AppColors.blue,
    fontSize: 11,
    fontWeight: FontWeight.bold,
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
      text = '';
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 4,
    child: Text(text, style: style),
  );
}
