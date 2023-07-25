import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';

Widget containerChart(BuildContext context, Widget child) {
  return InteractiveViewer(
    panEnabled: false,
    boundaryMargin: const EdgeInsets.all(100),
    minScale: 0.5,
    maxScale: 2,
    child: Container(
      margin: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width - 32,
      height: MediaQuery.of(context).size.width - 32,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          color: AppColors.grey,
          width: 0.8,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(0.6),
            blurRadius: 2.4,
            spreadRadius: 0.8,
            offset: const Offset(0, 1),
          )
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    ),
  );
}
