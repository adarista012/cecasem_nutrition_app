import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';

Widget subtitleChart(String subtitle) {
  return Text(
    '$subtitle  ',
    style: TextStyle(
        color: AppColors.blue, fontSize: 16, fontWeight: FontWeight.w500),
  );
}
