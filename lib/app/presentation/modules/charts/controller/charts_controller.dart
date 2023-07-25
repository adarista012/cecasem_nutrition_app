import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:cecasem_nutricion_app/app/domain/repositories/sheets_repository.dart';
import 'package:cecasem_nutricion_app/app/utils/app_constants.dart';

class ChartsController extends SimpleNotifier {
  final _sheetsRepository = Get.find<SheetsRepository>();
  final List<String> _listOfTabs = AppConstants.listOfTabs;
  final PreferredSizeWidget _tabBar = const TabBar(
    tabs: [
      Tab(text: AppConstants.titleWeight),
      Tab(text: AppConstants.titleHeigth),
      Tab(text: AppConstants.titleDiagnosis),
      Tab(text: AppConstants.titleUnNutrition),
      Tab(text: AppConstants.titleTotal),
    ],
  );

  List<dynamic>? _xAxis;
  List<dynamic>? _yAxis;
  List<double> _axis = [];
  final List<dynamic> _weigthChart = [];
  final List<dynamic> _heightChart = [];
  final List<dynamic> _totalChart = [];
  final List<String> _listOfComunitys = [];
  final List<double> _listOfNutrition = [];
  final List<double> _listOfUndernutrition = [];
  final Map<int, double> _mapOfNutrition = {};
  final Map<int, double> _mapOfUndernutrition = {};
  String? _comunity;

  bool _isLoading = false;
  List<String> get listOfTabs => _listOfTabs;
  PreferredSizeWidget get tabBar => _tabBar;
  bool get isLoading => _isLoading;
  List<dynamic>? get xAxis => _xAxis;
  List<dynamic>? get yAxis => _yAxis;
  List<dynamic>? get weigthChart => _weigthChart;
  List<dynamic>? get heightChart => _heightChart;
  List<dynamic>? get totalChart => _totalChart;
  List<String>? get listOfComunitys => _listOfComunitys;
  List<double> get listOfNutrition => _listOfNutrition;
  List<double> get listOfUndernutrition => _listOfUndernutrition;
  Map<int, double> get mapOfNutrition => _mapOfNutrition;
  Map<int, double> get mapOfUndernutrition => _mapOfUndernutrition;
  String? get comunity => _comunity;

  List<double> get axis => _axis;

  ChartsController() {
    _init();
  }

  void restart() {
    _xAxis = null;
    _yAxis = null;
  }

  void _init() async {
    _isLoading = true;

    final firebaseinstance = FirebaseFirestore.instance.collection(
      'comunitys',
    );
    await firebaseinstance.get().then((value) {
      _listOfComunitys.addAll(value.docs.map((e) => e.data()['comunity']));
    });
    _isLoading = false;
    notify();
  }

  void changeComunity(String value) {
    _comunity = value;
    notify();
  }

  void switchChart(String tab) {
    switch (tab) {
      case AppConstants.titleWeight:
        _weigthChart.clear();
        chart(9, _weigthChart);
      case AppConstants.titleHeigth:
        _heightChart.clear();
        chart(10, _heightChart);
      case AppConstants.titleDiagnosis:
        chartDiagnosis();
      case AppConstants.titleUnNutrition:
        chartUnNutrition();
      case AppConstants.titleTotal:
        pieChart();
    }
    notify();
  }

  void chartUnNutrition() async {
    _isLoading = true;
    List date = await _sheetsRepository.get(3);
    List diagnosis = await _sheetsRepository.get(12);
    List weights = await _sheetsRepository.get(9);
    List comunitys = await _sheetsRepository.get(6);
    List<int> counterN = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    List<int> counterUN = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    Map<int, double> mapUnderNutrition = {
      1: 0.0,
      2: 0.0,
      3: 0.0,
      4: 0.0,
      5: 0.0,
      6: 0.0,
      7: 0.0,
      8: 0.0,
      9: 0.0,
      10: 0.0,
      11: 0.0,
      12: 0.0
    };
    Map<int, double> mapNutrition = {
      1: 0.0,
      2: 0.0,
      3: 0.0,
      4: 0.0,
      5: 0.0,
      6: 0.0,
      7: 0.0,
      8: 0.0,
      9: 0.0,
      10: 0.0,
      11: 0.0,
      12: 0.0
    };

    for (int i = 0; i < date.length; i++) {
      var d = DateTime.fromMillisecondsSinceEpoch(int.parse(date[i]));
      if (comunitys[i] == _comunity) {
        if (diagnosis[i] == 'Desnutrición') {
          counterUN[d.month - 1]++;
          mapUnderNutrition[d.month] =
              mapUnderNutrition[d.month]! + double.parse(weights[i]);
        } else {
          counterN[d.month - 1]++;
          mapNutrition[d.month] =
              mapNutrition[d.month]! + double.parse(weights[i]);
        }
      }
    }
    for (int i = 0; i < counterN.length; i++) {
      mapNutrition[i + 1] =
          counterN[i] == 0 ? 0 : mapNutrition[i + 1]! / counterN[i];
      // print(mapNutrition[i + 1]);
      mapUnderNutrition[i + 1] =
          counterUN[i] == 0 ? 0 : mapUnderNutrition[i + 1]! / counterUN[i];
      // print(mapUnderNutrition[i + 1]);
    }
    _mapOfNutrition.addAll(mapNutrition);
    _mapOfUndernutrition.addAll(mapUnderNutrition);

    _isLoading = false;
    notify();
  }

  void pieChart() async {
    _totalChart.clear();
    _isLoading = true;
    List<double> listPresentation = [0.0, 0.0, 0.0, 0.0, 0.0];
    List ages = await _sheetsRepository.get(8);
    List comunitys = await _sheetsRepository.get(6);
    int total = 0;
    for (int i = 0; i < ages.length; i++) {
      int age = int.parse(ages[i]);
      if (comunitys[i] == comunity) {
        if (age >= 0 && age <= 24) {
          listPresentation[0]++;
          total++;
        }
        if (age > 24 && age <= 60) {
          listPresentation[1]++;
          total++;
        }
        if (age > 60 && age <= 96) {
          listPresentation[2]++;
          total++;
        }
        if (age > 96 && age <= 120) {
          listPresentation[3]++;
          total++;
        }
        if (age > 120 && age <= 144) {
          listPresentation[4]++;
          total++;
        }
      }
    }
    _totalChart.addAll(
      listPresentation.map((e) => (e / (total * 0.01)).round()).toList(),
    );
    _isLoading = false;
    notify();
  }

  void chartDiagnosis() async {
    _listOfNutrition.clear();
    _listOfUndernutrition.clear();
    _isLoading = true;

    List<double> nutritionList = [0.0, 0.0, 0.0, 0.0, 0.0];
    List<double> underNutritionList = [0.0, 0.0, 0.0, 0.0, 0.0];
    List<int> nutritionalCounter = [0, 0, 0, 0, 0];
    List<int> unutritionalCounter = [0, 0, 0, 0, 0];

    List ages = await _sheetsRepository.get(8);
    List comunitys = await _sheetsRepository.get(6);
    List nutritions = await _sheetsRepository.get(12);
    List weights = await _sheetsRepository.get(9);
    for (int i = 0; i < comunitys.length; i++) {
      if (comunitys[i] == _comunity) {
        int age = int.parse(ages[i]);
        if (age >= 0 && age <= 24) {
          if (nutritions[i] == 'Desnutrición') {
            underNutritionList[0] += double.parse(weights[i]);
            unutritionalCounter[0]++;
          } else {
            nutritionList[0] += double.parse(weights[i]);
            nutritionalCounter[0]++;
          }
        }
        if (age > 24 && age <= 60) {
          if (nutritions[i] == 'Desnutrición') {
            underNutritionList[1] += double.parse(weights[i]);
            unutritionalCounter[1]++;
          } else {
            nutritionList[1] += double.parse(weights[i]);
            nutritionalCounter[1]++;
          }
        }
        if (age > 60 && age <= 96) {
          if (nutritions[i] == 'Desnutrición') {
            underNutritionList[2] += double.parse(weights[i]);
            unutritionalCounter[2]++;
          } else {
            nutritionList[2] += double.parse(weights[i]);
            nutritionalCounter[2]++;
          }
        }
        if (age > 96 && age <= 120) {
          if (nutritions[i] == 'Desnutrición') {
            underNutritionList[3] += double.parse(weights[i]);
            unutritionalCounter[3]++;
          } else {
            nutritionList[3] += double.parse(weights[i]);
            nutritionalCounter[3]++;
          }
        }
        if (age > 120 && age <= 144) {
          if (nutritions[i] == 'Desnutrición') {
            underNutritionList[4] += double.parse(weights[i]);
            unutritionalCounter[4]++;
          } else {
            nutritionList[4] += double.parse(weights[i]);
            nutritionalCounter[4]++;
          }
        }
      }
    }
    for (int i = 0; i < nutritionalCounter.length; i++) {
      if (nutritionalCounter[i] != 0) {
        _listOfNutrition.add(nutritionList[i] / nutritionalCounter[i]);
      } else {
        _listOfNutrition.add(0);
      }
      if (unutritionalCounter[i] != 0) {
        _listOfUndernutrition
            .add(underNutritionList[i] / unutritionalCounter[i]);
      } else {
        _listOfUndernutrition.add(0);
      }
    }

    _isLoading = false;
    notify();
  }

  void chart(int column, List list) async {
    _isLoading = true;
    notify();
    final x = await agesPresentation();
    final y = await axisPresentation(column, list);

    _xAxis = x;
    _yAxis = y;

    _isLoading = false;
    notify();
  }

  double maxY(List y) {
    double max = 0;
    for (var e in y) {
      if (e > max) max = e;
    }
    return max;
  }

  Future<List> axisPresentation(int column, List l) async {
    List<int> x = [];
    List<double> y = [];
    await _sheetsRepository.get(column).then((value) {
      for (int i = 0; i < value.length; i++) {
        y.add(double.parse(value[i]));
      }
    });
    await _sheetsRepository.get(8).then((value) {
      for (int i = 0; i < value.length; i++) {
        x.add(int.parse(value[i]));
      }
    });

    await chartPresentation(x, y, l);

    return y;
  }

  Future<List> agesPresentation() async {
    List<int> x = [0, 0, 0, 0, 0];

    await _sheetsRepository.get(8).then((value) {
      for (int i = 0; i < value.length; i++) {
        if (int.parse(value[i]) >= 0 && int.parse(value[i]) <= 24) x[0]++;
        if (int.parse(value[i]) > 24 && int.parse(value[i]) <= 60) x[1]++;
        if (int.parse(value[i]) > 60 && int.parse(value[i]) <= 96) x[2]++;
        if (int.parse(value[i]) > 96 && int.parse(value[i]) <= 120) x[3]++;
        if (int.parse(value[i]) > 120 && int.parse(value[i]) <= 144) x[4]++;
      }
    });

    return x;
  }

  Future<List> chartPresentation(
    List<int> ages,
    List<dynamic> weights,
    List<dynamic> listPresentation,
  ) async {
    _axis = [];
    List<int> x = [0, 0, 0, 0, 0];
    List<double> y = [0, 0, 0, 0, 0];
    List<double> p = [0, 0, 0, 0, 0];
    List comunitys = await _sheetsRepository.get(6);
    for (int i = 0; i < comunitys.length; i++) {
      if (comunitys[i] == _comunity) {
        if (ages[i] >= 0 && ages[i] <= 24) {
          x[0]++;
          y[0] += weights[i];
        }
        if (ages[i] > 24 && ages[i] <= 60) {
          x[1]++;
          y[1] += weights[i];
        }
        if (ages[i] > 60 && ages[i] <= 96) {
          x[2]++;
          y[2] += weights[i];
        }
        if (ages[i] > 96 && ages[i] <= 120) {
          x[3]++;
          y[3] += weights[i];
        }
        if (ages[i] > 120 && ages[i] <= 144) {
          x[4]++;
          y[4] += weights[i];
        }
      }
    }

    for (int i = 0; i < p.length; i++) {
      if (x[i] != 0) {
        p[i] = double.parse((double.parse(y[i].toString()) / x[i]).toString());
      } else {
        p[i] = 0;
      }
      _axis.add(p[i]);
      listPresentation.add(p[i]);
    }

    return p;
  }
}
