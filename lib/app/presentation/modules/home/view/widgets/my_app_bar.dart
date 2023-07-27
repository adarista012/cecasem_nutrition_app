import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:cecasem_nutricion_app/app/utils/app_constants.dart';
import 'package:flutter/material.dart';

AppBar myAppBar() {
  return AppBar(
    actions: [
      Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Image.asset(
          AppConstants.logoOrgAssetRoute,
          width: 64,
        ),
      ),
      Expanded(child: Container()),
      Builder(
        builder: (context) => IconButton(
          icon: Icon(
            Icons.menu,
            color: AppColors.mainColor,
          ),
          onPressed: () => Scaffold.of(context).openEndDrawer(),
        ),
      ),
    ],
    elevation: 0.0,
    backgroundColor: AppColors.white,
  );
}
