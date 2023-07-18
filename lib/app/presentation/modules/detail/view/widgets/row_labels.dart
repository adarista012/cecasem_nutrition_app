import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';

Widget rowLabels(String label, String data) {
  return Padding(
    padding: const EdgeInsets.only(top: 4.0),
    child: Builder(builder: (context) {
      return Container(
        height: 36,
        color: AppColors.mainColor.withOpacity(0.08),
        child: Row(
          children: [
            Text(
              '$label: ',
              style: TextStyle(
                fontSize: 18.0,
                color: AppColors.mainColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            Flexible(
              child: Text(
                data,
                style: TextStyle(
                  fontSize: 18.0,
                  color: AppColors.blue,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      );
    }),
  );
}
