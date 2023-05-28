import 'dart:ui';

import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class ProgressDialog {
  static void show(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => WillPopScope(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: AppColors.grey.withOpacity(0.5),
          alignment: Alignment.center,
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5,
              sigmaY: 5,
            ),
            child: const CircularProgressIndicator(),
          ),
        ),
        onWillPop: () async => false,
      ),
    );
  }
}
