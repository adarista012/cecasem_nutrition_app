import 'package:cecasem_nutricion_app/app/presentation/modules/charts/controller/charts_controller.dart';
import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:cecasem_nutricion_app/app/utils/app_constants.dart';
import 'package:flutter/material.dart';

class DesnutritionChart extends StatelessWidget {
  final ChartsController controller;
  const DesnutritionChart({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppConstants.titleDesnutrition,
        style:
            TextStyle(color: AppColors.mainColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
