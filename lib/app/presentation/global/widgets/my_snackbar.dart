import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:cecasem_nutricion_app/app/utils/app_constants.dart';
import 'package:flutter/material.dart';

SnackBar mySnackBar(String text, Color color, int duration) {
  return SnackBar(
    content: Text(text),
    backgroundColor: color,
    duration: Duration(seconds: duration),
    action: SnackBarAction(
      label: AppConstants.ok.toLowerCase(),
      textColor: AppColors.white,
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );
}
