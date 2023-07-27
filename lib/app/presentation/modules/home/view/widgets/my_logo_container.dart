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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            color: AppColors.white,
            child: Image.asset(AppConstants.logoHomeAssetRoute),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppConstants.kLogoLabelFirst,
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontWeight: FontWeight.w800,
                  fontSize: 8,
                ),
              ),
              Text(
                AppConstants.kLogoLabelSecond,
                style: TextStyle(
                  color: AppColors.blue,
                  fontWeight: FontWeight.w800,
                  fontSize: 8,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
