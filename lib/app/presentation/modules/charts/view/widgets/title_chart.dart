import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';

Widget titleChart(String title) {
  return Text(
    title,
    style: TextStyle(
      color: AppColors.mainColor,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
  );
}
