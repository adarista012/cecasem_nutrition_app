import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget? myAppBar(String title) {
  return AppBar(
    backgroundColor: AppColors.white,
    elevation: 0.0,
    centerTitle: true,
    iconTheme: IconThemeData(
      color: AppColors.mainColor,
    ),
    title: Text(
      title,
      style: TextStyle(
        color: AppColors.mainColor,
      ),
    ),
  );
}
