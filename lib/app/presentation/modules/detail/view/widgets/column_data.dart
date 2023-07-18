import 'package:cecasem_nutricion_app/app/presentation/modules/detail/controller/detail_controller.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/detail/view/widgets/row_labels.dart';
import 'package:cecasem_nutricion_app/app/utils/app_constants.dart';
import 'package:flutter/material.dart';

class ColumnData extends StatelessWidget {
  final DetailController controller;
  const ColumnData({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return controller.isLoading == true
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                rowLabels(
                    AppConstants.name, controller.map[AppConstants.kLabelName]),
                rowLabels(AppConstants.lastName,
                    controller.map[AppConstants.kLabelLastame]),
                rowLabels(
                  AppConstants.comunity,
                  controller.map[AppConstants.kLabelComunity],
                ),
                rowLabels(
                    AppConstants.sex, controller.map[AppConstants.kLabelSex]),
                rowLabels(AppConstants.age,
                    '${controller.map[AppConstants.kLabelMonths].toString()} ${AppConstants.months}'),
                rowLabels(AppConstants.titleWeight,
                    '${controller.map[AppConstants.kLabelWeight].toString()} Kg.'),
                rowLabels(AppConstants.titleHeigth,
                    '${controller.map[AppConstants.kLabelHeigth].toString()} cm.'),
                rowLabels(AppConstants.imc,
                    controller.map[AppConstants.kLabelImc].toString()),
                rowLabels(AppConstants.nutritionalDiagnosis,
                    controller.map[AppConstants.kLabelNutricionalDiagnosis]),
                rowLabels(
                    "Predicción diagnóstico",
                    controller.map[
                        AppConstants.kLabelNutricionalDiagnosisPrediction]),
                rowLabels(
                  'Fecha',
                  DateTime.fromMillisecondsSinceEpoch(
                          controller.map[AppConstants.kLabelTimeStamp])
                      .toLocal()
                      .toString(),
                ),
                rowLabels('Usuario', controller.map[AppConstants.kUser]),
              ],
            ),
          );
  }
}
