import 'package:cecasem_nutricion_app/app/utils/sheets_credentials.dart';

class AppConstants {
  static const String kNameToTheApp = 'Cecasem Nutrición';
  static const String kFirebasefirestoreCollection = 'surveys';
  static const String kGoogleSheetsCredentials = SheetsCredentials.credential;

  static const String kNameGoogleSheetsData = 'data';
  //
  static const String kLabelDate = 'Date';
  static const String kLabelTimeStamp = 'Time Stamp';
  static const String kLabelName = 'Name';
  static const String kLabelLastame = 'Last name';
  static const String kLabelComunity = 'Comunity';
  static const String kLabelSex = 'Sex';
  static const String kLabelMonths = 'Age in months';
  static const String kLabelWeight = 'Weight in kg';
  static const String kLabelHeigth = 'Heigth in cm';
  static const String kLabelImc = 'IMC';
  static const String kLabelNutricionalDiagnosis = 'Nutricional diagnosis';
  static const String kLabelNutricionalDiagnosisPrediction =
      'Nutricional diagnosis prediction';
  static const String kLabelFirebaseId = 'Firebase id';
  //
  static const String kUser = 'User';
  static String headerCharts = 'Estadísticas';
  static String headerSurvey = 'Agregar encuesta';
  static String add = 'Agregar';
  static String search = 'Buscar';
  static String save = 'Guardar';
  static String savedSurvey = 'Encuesta guardada';
  static String nutritionalDiagnosisWrong = 'Diagnóstico nutricional erróneo';
  static String nutritionalDiagnosis = 'Diagnóstico nutricional';
  static String exponencial = '2';
  static String imcUnits = 'Kg/m';
  static String imc = 'imc';
  static String textfieldWeight = 'Peso en Kg.';
  static String textfieldHeigth = 'Talla en cm.';
  static String months = 'Meses';
  static String years = 'Años';
  static String age = 'Edad';
  static String sex = 'Sexo';
  static String male = 'Masculino';
  static String female = 'Femenino';
  static String name = 'Nombre';
  static String lastName = 'Apellido';
  static String comunity = 'Comunidad';
  static String email = 'Correo electrónico';
  static String invalidEmail = 'El correo electrónico es inválido';

  static String login = 'Ingresar';
  static String logout = 'Cerrar sesión';
  static String password = 'Contraseña';
  static String passwordMustBe =
      'La contraseña debe tener más de cinco caracteres';
  static String logoAssetRoute = 'images/logo.png';
  static String error = 'Error';
  static const String ok = 'Ok';
// routes
  static const String routeHome = '/home';
  static const String routeSplash = '/splash';
  static const String routeLogin = '/login';
  static const String routeAddSurvey = '/add_survey';
  static const String routeSearchSurvey = '/search_survey';
  static const String routeCharts = '/charts';
  static const String routeDetail = '/detail';
  //
  // tab titles

  static const String titleWeight = "Peso";
  static const String titleHeigth = "Talla";
  static const String titleDiagnosis = "Diagnóstico";
  static const String titleUnNutrition = "Desnutrición";
  static const String titleTotal = "Total";

  //Alerts
  static const String ageUnsuported =
      'La edad debe no puede superar los doce años';

  // charts

  static List<String> listOfTabs = [
    AppConstants.titleWeight,
    AppConstants.titleHeigth,
    AppConstants.titleDiagnosis,
    AppConstants.titleUnNutrition,
    AppConstants.titleTotal,
  ];

  //searcher
  static const String searcher = 'Buscador';
  static const String searcherIndications = 'Ingrese el nombre a buscar';
  static const String searcherLabel = 'Ingrese algún nombre';

  static const String detail = "Detalle";
}
