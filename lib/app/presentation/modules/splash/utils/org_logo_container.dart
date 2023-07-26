import 'package:cecasem_nutricion_app/app/utils/app_constants.dart';
import 'package:flutter/material.dart';

Widget orgLogoContainer(double width) {
  return Container(
    alignment: Alignment.bottomCenter,
    height: width,
    child: SizedBox(
      width: 120,
      height: 120,
      child: Image.asset(
        AppConstants.logoOrgAssetRoute,
      ),
    ),
  );
}
