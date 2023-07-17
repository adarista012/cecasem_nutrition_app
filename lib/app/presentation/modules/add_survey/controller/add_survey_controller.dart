import 'package:cecasem_nutricion_app/app/domain/repositories/authentication_repository.dart';
import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:cecasem_nutricion_app/app/utils/app_constants.dart';
import 'package:cecasem_nutricion_app/precentil_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import '../../../../domain/repositories/firebase_repository.dart';

class AddSurveyController extends SimpleNotifier {
  final _firebaseRepository = Get.find<FirebaseRepository>();
  final AuthenticationRepository _auth = Get.find();
  static const List<int> _listMonths = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
  static const List<int> _listYears = [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12
  ];
  static final List<String> _listSex = [AppConstants.male, AppConstants.female];
  static const List<String> _listDiagnosis = <String>[
    'Desnutrición',
    'Peso saludable',
    'Sobrepeso',
    'Obesidad'
  ];
  static const List<int> _listPercentils = <int>[
    1,
    3,
    5,
    15,
    25,
    50,
    75,
    85,
    95,
    97,
    99
  ];

  int _months = 0;
  int _years = 0;
  int? _indexImcIndicator;
  String _sex = _listSex.first;
  String? _error;
  String? _imc;
  String? _nutritionalDiagnosis;
  String? _comunity;
  bool? _nutritionalDiagnosisWrong = false;
  bool? _isLoading = false;
  Color _nutritionalDiagnosisColor = AppColors.grey;
  final List<String> _listOfComunitys = [];

  final DateTime _dateTime = DateTime.now();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  // final TextEditingController _comunityController = TextEditingController();
  final TextEditingController _ageController = TextEditingController(text: '0');
  final TextEditingController _monthsController =
      TextEditingController(text: '0');
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heigthController = TextEditingController();
  TextEditingController get nameController => _nameController;
  TextEditingController get lastNameController => _lastNameController;
  TextEditingController get ageController => _ageController;
  // TextEditingController get comunityController => _comunityController;
  TextEditingController get monthsController => _monthsController;
  TextEditingController get weightController => _weightController;
  TextEditingController get heigthController => _heigthController;
  List<int> get listMonths => _listMonths;
  List<int> get listYears => _listYears;
  List<String> get listSex => _listSex;
  List<String> get listDiagnosis => _listDiagnosis;
  String? get error => _error;
  String? get imc => _imc;
  String? get nutritionalDiagnosis => _nutritionalDiagnosis;
  Color? get nutritionalDiagnosisColor => _nutritionalDiagnosisColor;
  bool? get nutritionalDiagnosisWrong => _nutritionalDiagnosisWrong;
  bool? get isLoading => _isLoading;
  String? get comunity => _comunity;
  String? get sex => _sex;
  int? get months => _months;
  int? get years => _years;
  List<String> get listOfComunitys => _listOfComunitys;

  AddSurveyController() {
    _init();
  }

  void _init() async {
    _isLoading = true;
    _listOfComunitys.clear();

    final firebaseinstance = FirebaseFirestore.instance.collection(
      'comunitys',
    );
    await firebaseinstance.get().then((value) {
      _listOfComunitys.addAll(value.docs.map((e) => e.data()['comunity']));
    });
    _isLoading = false;
    notify();
  }

  void calculateIMC() {
    double weight = editNumber(_weightController.value.text);
    double heigth = editNumber(_heigthController.value.text);
    var imc = weight / heigth / heigth * 10000;
    _imc = imc.toStringAsFixed(2);
    notify();
  }

  void calculateNutritionalDiagnois() {
    _indexImcIndicator = null;
    _nutritionalDiagnosis = null;
    if (totalMonths() <= 144) {
      double currentImc =
          double.parse(double.parse(imc!).floor().toStringAsFixed(1));
      if (_sex == 'Femenino') {
        if (currentImc > Precentil.listF[totalMonths()].last) {
          _indexImcIndicator = Precentil.listF[totalMonths()].length - 1;
        }
        if (currentImc < Precentil.listF[totalMonths()].first) {
          _indexImcIndicator = 0;
        }
        for (int index = 0;
            index < Precentil.listF[totalMonths()].length;
            index++) {
          if (currentImc <= Precentil.listF[totalMonths()][index]) {
            _indexImcIndicator = index;
            break;
          }
        }
      } else {
        // print(totalMonths());
        // print(Precentil.listM[totalMonths()]);
        if (currentImc > Precentil.listM[totalMonths()].last) {
          _indexImcIndicator = Precentil.listM[totalMonths()].length - 1;
        }
        if (currentImc < Precentil.listM[totalMonths()].first) {
          _indexImcIndicator = 0;
        }
        for (int index = 0;
            index < Precentil.listM[totalMonths()].length;
            index++) {
          if (currentImc <= Precentil.listM[totalMonths()][index]) {
            _indexImcIndicator = index;
            break;
          }
        }
      }
    } else {
      _error = AppConstants.ageUnsuported;
    }
    if (_indexImcIndicator != null) {
      if (_listPercentils[_indexImcIndicator!] < 5) {
        _nutritionalDiagnosis = _listDiagnosis.first;
        _nutritionalDiagnosisColor = AppColors.amber;
      }
      if (_listPercentils[_indexImcIndicator!] >= 5 &&
          _listPercentils[_indexImcIndicator!] < 85) {
        _nutritionalDiagnosis = _listDiagnosis[1];
        _nutritionalDiagnosisColor = AppColors.greenCheck;
      }
      if (_listPercentils[_indexImcIndicator!] >= 85 &&
          _listPercentils[_indexImcIndicator!] < 95) {
        _nutritionalDiagnosis = _listDiagnosis[2];
        _nutritionalDiagnosisColor = AppColors.yellow;
      }
      if (_listPercentils[_indexImcIndicator!] >= 95) {
        _nutritionalDiagnosis = _listDiagnosis.last;
        _nutritionalDiagnosisColor = AppColors.red;
      }
    }
    notify();
  }

  double editNumber(String value) {
    String valueW = value.replaceAll(RegExp(r','), '.');
    double val = double.parse(valueW);

    return val;
  }

  void editMonth(int? value) {
    _months = value!;
    totalMonths();
    if (totalMonths() >= 0 &&
        _heigthController.value.text.isNotEmpty &&
        _weightController.value.text.isNotEmpty) {
      calculateIMC();
      calculateNutritionalDiagnois();
    }
    notify();
  }

  void checkBoxChange(bool? value) {
    _nutritionalDiagnosisWrong = value;
    notify();
  }

  void editYear(int? value) {
    _years = value!;
    totalMonths();
    if (totalMonths() >= 0 &&
        _heigthController.value.text.isNotEmpty &&
        _weightController.value.text.isNotEmpty) {
      calculateIMC();
      calculateNutritionalDiagnois();
    }
    notify();
  }

  void editSex(String? value) {
    _sex = value!;

    if (totalMonths() >= 0 &&
        _heigthController.value.text.isNotEmpty &&
        _weightController.value.text.isNotEmpty) {
      calculateIMC();
      calculateNutritionalDiagnois();
    }
    notify();
  }

  void editDiagnosis(String? value) {
    _nutritionalDiagnosis = value!;
    notify();
  }

  void editComunity(String? value) {
    _comunity = value;
    notify();
  }

  int totalMonths() {
    int total = (_years * 12) + _months;

    return total;
  }

  void weightChange(String value) {
    _error = null;
    double val = editNumber(value);

    if (val < 0) {
      _error = 'El peso debe ser mayor a cero';
    } else {
      if (totalMonths() >= 0 && _heigthController.value.text.isNotEmpty) {
        calculateIMC();
        calculateNutritionalDiagnois();
      }
    }
    notify();
  }

  void heigthChange(String value) {
    _error = null;

    double val = editNumber(value);
    if (val < 0) {
      _error = 'La talla debe ser mayor a cero';
    } else {
      if (totalMonths() >= 0 && _weightController.value.text.isNotEmpty) {
        calculateIMC();
        calculateNutritionalDiagnois();
      }
    }
    notify();
  }

  void nameChange(String? value) {
    _error = null;
    notify();
  }

  void lastNameChange(String? value) {
    _error = null;
    notify();
  }

  Future<String> getUserName() async {
    var auth = await _auth.user;
    String? name = auth!.displayName;
    String? email = auth.email;
    return email ?? name ?? 'Usuario sin nombre';
  }

  void sendSurvey(BuildContext _) async {
    _isLoading = true;
    notify();
    if (_heigthController.value.text.isEmpty) {
      _error = 'La talla debe ser mayor a cero';
    }
    if (_heigthController.value.text.isNotEmpty) {
      double heigth = editNumber(_heigthController.value.text);
      if (heigth <= 0) {
        _error = 'La talla debe ser mayor a cero';
      }
    }
    if (_weightController.value.text.isEmpty) {
      _error = 'El peso debe ser mayor a cero';
    }
    if (_weightController.value.text.isNotEmpty) {
      double weight = editNumber(_weightController.value.text);
      if (weight <= 0) {
        _error = 'El peso debe ser mayor a cero';
      }
    }
    if (comunity == null) {
      _error = 'El campo comunidad no puede estar vacio';
    }
    if (lastNameController.value.text == '' &&
        lastNameController.value.text.isEmpty) {
      _error = 'El campo apellido no puede estar vacio';
    }
    if (nameController.value.text == '' && nameController.value.text.isEmpty) {
      _error = 'El campo nombre no puede estar vacio';
    }
    if (nameController.value.text.isNotEmpty &&
        lastNameController.value.text.isNotEmpty &&
        comunity != null &&
        _weightController.value.text.isNotEmpty &&
        _heigthController.value.text.isNotEmpty) {
      await _firebaseRepository.uploadSurvey(
        date: _dateTime,
        timeStamp: _dateTime.millisecondsSinceEpoch,
        name: _nameController.value.text,
        lastame: _lastNameController.value.text,
        comunity: _comunity ?? '',
        sex: _sex,
        months: totalMonths(),
        weight: editNumber(_weightController.value.text),
        heigth: editNumber(_heigthController.value.text),
        imc: double.parse(_imc!),
        nutricionalDiagnosis: _nutritionalDiagnosis!,
        user: await getUserName(),
        context: _,
      );
    }
    _isLoading = false;
    notify();
  }
}
