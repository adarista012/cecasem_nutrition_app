import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';

AppBar myAppBar() {
  return AppBar(
    leading: Builder(
      builder: (context) => IconButton(
        icon: Icon(
          Icons.menu,
          color: AppColors.mainColor,
        ),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
    ),
    elevation: 0.0,
    backgroundColor: AppColors.white,
  );
}
