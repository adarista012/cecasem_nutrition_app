import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';

Widget chartPieData(String text, Color color) {
  return Row(
    children: [
      Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: color,
          boxShadow: [
            BoxShadow(
              color: AppColors.grey.withOpacity(0.6),
              blurRadius: 2.4,
              spreadRadius: 0.8,
              offset: const Offset(0, 1),
            )
          ],
        ),
      ),
      SizedBox(
        width: 96,
        child: Text(
          ' $text',
          style: TextStyle(
            color: AppColors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}
