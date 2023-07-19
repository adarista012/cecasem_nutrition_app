import 'package:cecasem_nutricion_app/app/presentation/modules/add_survey/controller/add_survey_controller.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/add_survey/view/widgets/my_text_flied.dart';
import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:cecasem_nutricion_app/app/utils/app_constants.dart';
import 'package:flutter/material.dart';

class MyForm extends StatelessWidget {
  final AddSurveyController controller;
  const MyForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (controller.isLoading == true) {
      return const CircularProgressIndicator();
    }
    return ListView(
      shrinkWrap: true,
      children: [
        controller.error != null
            ? Center(
                child: Text(
                  controller.error ?? '',
                  style: TextStyle(
                    color: AppColors.red,
                    fontSize: 20.0,
                  ),
                ),
              )
            : const SizedBox(),
        MyTextField(
          controller: controller.nameController,
          isText: true,
          isError: false,
          label: AppConstants.name,
          myOnChangeFunction: controller.nameChange,
        ),
        MyTextField(
          controller: controller.lastNameController,
          isText: true,
          isError: false,
          label: AppConstants.lastName,
          myOnChangeFunction: controller.lastNameChange,
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 4.0,
            right: 2.0,
            left: 2.0,
            bottom: 4.0,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 1.6,
                  color: AppColors.mainColor,
                ),
              ),
              Text(
                ' ${AppConstants.comunity} ',
                style: TextStyle(
                  color: AppColors.mainColor,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 1.6,
                  color: AppColors.mainColor,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 58,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.mainColor,
              ),
              borderRadius: BorderRadius.circular(8.0)),
          child: DropdownButton(
            value: controller.comunity,
            padding: const EdgeInsets.all(8.0),
            elevation: 16,
            underline: Container(
              color: AppColors.transparent,
            ),
            items: controller.listOfComunitys
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value.toString()),
              );
            }).toList(),
            onChanged: controller.editComunity,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 0.0,
            right: 2.0,
            left: 2.0,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 1.6,
                  color: AppColors.mainColor,
                ),
              ),
              Text(
                ' ${AppConstants.sex} ',
                style: TextStyle(
                  color: AppColors.mainColor,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 1.6,
                  color: AppColors.mainColor,
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(AppConstants.female),
                Radio(
                  value: AppConstants.female,
                  groupValue: controller.sex!,
                  onChanged: controller.editSex,
                ),
              ],
            ),
            Row(
              children: [
                Text(AppConstants.male),
                Radio(
                  value: AppConstants.male,
                  groupValue: controller.sex!,
                  onChanged: controller.editSex,
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 0.0,
            right: 2.0,
            left: 2.0,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 1.6,
                  color: AppColors.mainColor,
                ),
              ),
              Text(
                ' ${AppConstants.age} ',
                style: TextStyle(
                  color: AppColors.mainColor,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 1.6,
                  color: AppColors.mainColor,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 58,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.mainColor,
                  ),
                  borderRadius: BorderRadius.circular(
                    8.0,
                  ),
                ),
                child: DropdownButton<int>(
                  padding: const EdgeInsets.all(8.0),
                  value: controller.years,
                  elevation: 16,
                  underline: Container(
                    color: AppColors.transparent,
                  ),
                  icon: Row(
                    children: [
                      Text(
                        ' ${AppConstants.years}',
                        style: TextStyle(
                          color: AppColors.grey,
                        ),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.grey,
                      )
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                  onChanged: controller.editYear,
                  items: controller.listYears
                      .map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Expanded(
              child: Container(
                height: 58,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.mainColor),
                    borderRadius: BorderRadius.circular(8.0)),
                child: DropdownButton<int>(
                  padding: const EdgeInsets.all(
                    8.0,
                  ),
                  value: controller.months,
                  underline: Container(
                    color: AppColors.transparent,
                  ),
                  elevation: 16,
                  icon: Row(
                    children: [
                      Text(
                        ' ${AppConstants.months}',
                        style: TextStyle(
                          color: AppColors.grey,
                        ),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.grey,
                      )
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                  onChanged: controller.editMonth,
                  items: controller.listMonths
                      .map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8.0,
        ),
        MyTextField(
          controller: controller.weightController,
          isText: false,
          isError: false,
          label: AppConstants.textfieldWeight,
          myOnChangeFunction: controller.weightChange,
        ),
        MyTextField(
          controller: controller.heigthController,
          isText: false,
          isError: false,
          label: AppConstants.textfieldHeigth,
          myOnChangeFunction: controller.heigthChange,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 6.0,
          ),
          child: Row(
            children: [
              Text(
                '${AppConstants.imc.toUpperCase()}: ',
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              Text(
                '${controller.imc ?? ''} ${AppConstants.imcUnits}',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 16,
                child: Text(
                  AppConstants.exponencial,
                  style: const TextStyle(
                    fontSize: 8,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 4.0,
            right: 2.0,
            left: 2.0,
            bottom: 4.0,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 1.6,
                  color: AppColors.mainColor,
                ),
              ),
              Text(
                ' ${AppConstants.nutritionalDiagnosis} ',
                style: TextStyle(
                  color: AppColors.mainColor,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 1.6,
                  color: AppColors.mainColor,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 58,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.mainColor,
              ),
              borderRadius: BorderRadius.circular(8.0)),
          child: DropdownButton(
            value: controller.nutritionalDiagnosis,
            padding: const EdgeInsets.all(8.0),
            elevation: 16,
            underline: Container(
              color: AppColors.transparent,
            ),
            items: controller.listDiagnosis
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value.toString()),
              );
            }).toList(),
            onChanged: controller.editDiagnosis,
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        MaterialButton(
          onPressed: () {
            controller.sendSurvey(context);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              8.0,
            ),
          ),
          color: AppColors.mainColor,
          height: 48.0,
          child: Text(
            AppConstants.save,
            style: TextStyle(color: AppColors.white, fontSize: 20.0),
          ),
        ),
      ],
    );
  }
}
