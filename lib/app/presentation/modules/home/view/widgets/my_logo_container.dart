import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:cecasem_nutricion_app/app/utils/app_constants.dart';
import 'package:flutter/material.dart';

class MyLogoContainer extends StatelessWidget {
  const MyLogoContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.all(32.0),
        color: AppColors.white,
        child: Image.asset(AppConstants.logoAssetRoute),
      ),
    );
  }
}
