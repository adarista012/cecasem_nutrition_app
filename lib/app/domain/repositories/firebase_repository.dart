import 'package:flutter/material.dart';

abstract class FirebaseRepository {
  Future<void> uploadSurvey({
    required DateTime date,
    required String user,
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
    required BuildContext context,
  });
  Future<Map<String, dynamic>> searchDocument(String id);
}
