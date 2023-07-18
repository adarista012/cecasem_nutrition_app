import 'package:cecasem_nutricion_app/app/presentation/modules/search_survey/controller/search_survey_controller.dart';
import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:cecasem_nutricion_app/app/utils/app_constants.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final SearchSurveyController controller;
  const SearchTextField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: controller.textOnChange,
        controller: controller.queryTextEditingController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          errorText: null,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.mainColor),
            borderRadius: BorderRadius.circular(8.0),
          ),
          labelText: AppConstants.searcherIndications,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
