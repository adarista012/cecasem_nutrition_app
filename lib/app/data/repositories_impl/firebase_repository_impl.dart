import 'package:cecasem_nutricion_app/app/domain/repositories/sheets_repository.dart';
import 'package:cecasem_nutricion_app/app/presentation/global/widgets/my_snackbar.dart';
import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:cecasem_nutricion_app/app/utils/app_constants.dart';
import 'package:cecasem_nutricion_app/app/domain/models/sheets_column.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';

import '../../domain/repositories/firebase_repository.dart';

class FirebaseRepositoryImpl extends FirebaseRepository {
  final _firebaseinstance = FirebaseFirestore.instance.collection(
    AppConstants.kFirebasefirestoreCollection,
  );

  final _sheetsRepository = Get.find<SheetsRepository>();
  @override
  Future<void> uploadSurvey({
    required DateTime date,
    required int timeStamp,
    required String name,
    required String lastame,
    required String comunity,
    required String sex,
    required int months,
    required double weight,
    required double heigth,
    required double imc,
    required String nutricionalDiagnosis,
    required String nutricionalDiagnosisPrediction,
    required String user,
    required BuildContext context,
  }) async {
    final Map<String, Object> mapFirebase = {
      AppConstants.kLabelDate: date,
      AppConstants.kUser: user,
      AppConstants.kLabelTimeStamp: timeStamp,
      AppConstants.kLabelName: name,
      AppConstants.kLabelLastame: lastame,
      AppConstants.kLabelComunity: comunity,
      AppConstants.kLabelSex: sex,
      AppConstants.kLabelMonths: months,
      AppConstants.kLabelWeight: weight,
      AppConstants.kLabelHeigth: heigth,
      AppConstants.kLabelImc: imc,
      AppConstants.kLabelNutricionalDiagnosis: nutricionalDiagnosis,
      AppConstants.kLabelNutricionalDiagnosisPrediction:
          nutricionalDiagnosisPrediction,
    };

    await _firebaseinstance.add(mapFirebase).then((value) async {
      final Map<String, dynamic> mapSheets = {
        SheetsColumn.date: date.toString(),
        SheetsColumn.user: user,
        SheetsColumn.timeStamp: timeStamp,
        SheetsColumn.name: name,
        SheetsColumn.lastame: lastame,
        SheetsColumn.comunity: comunity,
        SheetsColumn.sex: sex,
        SheetsColumn.months: months,
        SheetsColumn.weight: weight,
        SheetsColumn.heigth: heigth,
        SheetsColumn.imc: imc,
        SheetsColumn.nutricionalDiagnosis: nutricionalDiagnosis,
        SheetsColumn.nutricionalDiagnosisPrediction:
            nutricionalDiagnosisPrediction,
        SheetsColumn.firebaseId: value.id
      };
      await _sheetsRepository.insert([mapSheets]);
      router.maybePop();
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        mySnackBar(
          AppConstants.savedSurvey,
          AppColors.mainColor,
          8,
        ),
      );
    }).catchError(
      (error) {
        router.maybePop();
        ScaffoldMessenger.of(context).showSnackBar(
          mySnackBar(
            '${AppConstants.error}: $error',
            AppColors.red,
            24,
          ),
        );
      },
    );
  }

  @override
  Future<Map<String, dynamic>> searchDocument(String id) async {
    Map<String, dynamic> map = {};
    await _firebaseinstance.doc(id).get().then(
      (querySnapshot) {
        map.addAll(querySnapshot.data()!);
      },
    );
    return map;
  }
}
