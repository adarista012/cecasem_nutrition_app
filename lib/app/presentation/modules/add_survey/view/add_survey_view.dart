import 'package:cecasem_nutricion_app/app/presentation/modules/add_survey/view/widgets/my_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:cecasem_nutricion_app/app/presentation/global/widgets/my_appbar.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/add_survey/controller/add_survey_provider.dart';
import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:cecasem_nutricion_app/app/utils/app_constants.dart';

class AddSurveyView extends StatelessWidget {
  const AddSurveyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: myAppBar(
          AppConstants.headerSurvey,
        ),
        body: Center(
          child: Consumer(
            builder: (_, ref, __) {
              final controller = ref.watch(
                addSurveyProvider,
              );
              return Form(
                child: Padding(
                  padding: const EdgeInsets.all(
                    8.0,
                  ),
                  child: MyForm(
                    controller: controller,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
