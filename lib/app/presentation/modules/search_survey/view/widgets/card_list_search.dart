import 'package:cecasem_nutricion_app/app/presentation/modules/search_survey/controller/search_survey_controller.dart';
import 'package:cecasem_nutricion_app/app/presentation/routes/routes.dart';
import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

class CardListSearch extends StatelessWidget {
  const CardListSearch({
    super.key,
    required this.controller,
    required this.index,
  });

  final SearchSurveyController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          8.0,
        ),
      ),
      child: MaterialButton(
        onPressed: () {
          String id = controller.mapIds[controller.listSearcheable[index]]!;
          router.pushNamed(
            Routes.DETAIL,
            arguments: id,
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            8.0,
          ),
        ),
        padding: EdgeInsets.zero,
        child: ListTile(
          title: Text(
            controller.listSearcheable[index],
            style: TextStyle(
              color: AppColors.blue,
              fontWeight: FontWeight.w500,
              fontSize: 16.0,
            ),
          ),
          trailing: Icon(
            Icons.chevron_right,
            color: AppColors.mainColor,
          ),
          // TargetPlatform.iOS
          // defaultTargetPlatform.,
        ),
      ),
    );
  }
}
