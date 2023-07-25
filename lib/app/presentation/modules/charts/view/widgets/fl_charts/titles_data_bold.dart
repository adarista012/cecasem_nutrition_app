import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/fl_charts/trasparent_title.dart';
import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

FlTitlesData get titlesDataBold => const FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          getTitlesWidget: getTitles,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: transparentTitles,
          reservedSize: 16.0,
        ),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: transparentTitles,
          reservedSize: 16.0,
        ),
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: transparentTitles,
          reservedSize: 16.0,
        ),
      ),
    );

Widget getTitles(double value, TitleMeta meta) {
  final style = TextStyle(
    color: AppColors.transparent,
    fontSize: 12,
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
      text = ' ';
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 4,
    child: Text(text, style: style),
  );
}
