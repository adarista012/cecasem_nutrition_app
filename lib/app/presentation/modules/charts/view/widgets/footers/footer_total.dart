import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/chart_pie_data.dart';
import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class FooterTotal extends StatelessWidget {
  const FooterTotal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        left: 8.0,
      ),
      child: Column(
        children: [
          Row(
            children: [
              chartPieData(' 0-2 años', AppColors.mainColor),
              chartPieData(' 3-5 años', AppColors.amber),
              chartPieData(' 6-8 años', AppColors.grey),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              children: [
                chartPieData(' 9-10 años', AppColors.red),
                chartPieData(' 11-12 años', AppColors.blue),
              ],
            ),
          )
        ],
      ),
    );
  }
}
