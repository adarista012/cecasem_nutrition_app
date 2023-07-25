import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/fl_charts/bottom_title_unnutrition.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/fl_charts/left_titles_unnutrition.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/fl_charts/trasparent_title.dart';
import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

FlTitlesData titlesDataUnnutrition() {
  return FlTitlesData(
    leftTitles: AxisTitles(
      // axisNameSize: 8,
      axisNameWidget: Text(
        'Peso en Kg.',
        style: TextStyle(
          color: AppColors.blue,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
      sideTitles: const SideTitles(
        showTitles: true,
        getTitlesWidget: leftTitlesUnnutrition,
      ),
    ),
    rightTitles: const AxisTitles(
      sideTitles: SideTitles(
        reservedSize: 24,
        showTitles: true,
        getTitlesWidget: transparentTitles,
      ),
    ),
    topTitles: const AxisTitles(
      sideTitles: SideTitles(
        reservedSize: 24,
        showTitles: true,
        getTitlesWidget: transparentTitles,
      ),
    ),
    bottomTitles: const AxisTitles(
      sideTitles: SideTitles(
        reservedSize: 40,
        showTitles: true,
        getTitlesWidget: bottomTitleUnnutrition,
      ),
    ),
  );
}
