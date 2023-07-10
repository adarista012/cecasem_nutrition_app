import 'package:cecasem_nutricion_app/app/presentation/modules/charts/controller/charts_controller.dart';
import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:cecasem_nutricion_app/app/utils/app_constants.dart';
import 'package:flutter/material.dart';

class TotalChart extends StatelessWidget {
  final ChartsController controller;
  const TotalChart({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    controller.switchChart(
      AppConstants.titleTotal,
    );
    return Center(
      child: Text(
        AppConstants.titleTotal,
        style:
            TextStyle(color: AppColors.mainColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
