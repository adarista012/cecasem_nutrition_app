import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:cecasem_nutricion_app/app/utils/app_constants.dart';
import 'package:flutter/material.dart';

Widget logoContainer(double size) {
  return Center(
    child: Container(
      width: size - 128,
      height: size - 128,
      padding: const EdgeInsets.all(
        24.0,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(
          1028.0,
        ),
      ),
      child: Image.asset(
        AppConstants.logoAssetRoute,
      ),
    ),
  );
}
