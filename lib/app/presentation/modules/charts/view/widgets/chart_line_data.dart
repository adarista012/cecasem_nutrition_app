import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';

Widget chartLineData(String text, Color color) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0, left: 8.0),
    child: Row(
      children: [
        Container(
          width: 16,
          height: 4,
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
        Text(
          ' $text',
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
