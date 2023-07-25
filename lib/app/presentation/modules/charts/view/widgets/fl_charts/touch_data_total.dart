import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

void touchDataTotal(FlTouchEvent event, PieTouchResponse? response) {}
List<PieChartSectionData> showingSections(List<dynamic> list) {
  return List.generate(5, (i) {
    const fontSize = 16.0;
    const radius = 160.0;

    switch (i) {
      case 0:
        return PieChartSectionData(
          color: AppColors.mainColor,
          value: double.parse(list[0].toString()),
          title: '${list[0]}%',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
          titlePositionPercentageOffset: 0.8,
        );
      case 1:
        return PieChartSectionData(
          color: AppColors.amber,
          value: double.parse(list[1].toString()),
          title: '${list[1]}%',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
          titlePositionPercentageOffset: 0.8,
        );
      case 2:
        return PieChartSectionData(
          color: AppColors.grey,
          value: double.parse(list[2].toString()),
          title: '${list[2]}%',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
          titlePositionPercentageOffset: 0.8,
        );
      case 3:
        return PieChartSectionData(
          color: AppColors.red,
          value: double.parse(list[3].toString()),
          title: '${list[3]}%',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
          titlePositionPercentageOffset: 0.8,
        );
      case 4:
        return PieChartSectionData(
          color: AppColors.blue,
          value: double.parse(list[4].toString()),
          title: '${list[4]}%',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
          titlePositionPercentageOffset: 0.8,
        );
      default:
        throw Exception('Error de porcentajes');
    }
  });
}
