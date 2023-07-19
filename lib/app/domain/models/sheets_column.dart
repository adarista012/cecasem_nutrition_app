import 'package:cecasem_nutricion_app/app/utils/app_constants.dart';

class SheetsColumn {
  static const date = AppConstants.kLabelDate;
  static const user = AppConstants.kUser;
  static const timeStamp = AppConstants.kLabelTimeStamp;
  static const name = AppConstants.kLabelName;
  static const lastame = AppConstants.kLabelLastame;
  static const comunity = AppConstants.kLabelComunity;
  static const sex = AppConstants.kLabelSex;
  static const months = AppConstants.kLabelMonths;
  static const weight = AppConstants.kLabelWeight;
  static const heigth = AppConstants.kLabelHeigth;
  static const imc = AppConstants.kLabelImc;
  static const nutricionalDiagnosis = AppConstants.kLabelNutricionalDiagnosis;
  static const nutricionalDiagnosisPrediction =
      AppConstants.kLabelNutricionalDiagnosisPrediction;
  static const firebaseId = AppConstants.kLabelFirebaseId;

  static List<String> getColumns() => [
        date,
        user,
        timeStamp,
        name,
        lastame,
        comunity,
        sex,
        months,
        weight,
        heigth,
        imc,
        nutricionalDiagnosis,
        nutricionalDiagnosisPrediction,
        firebaseId
      ];
}
