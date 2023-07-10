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
      Tab(text: AppConstants.titleDesnutrition),
      Tab(text: AppConstants.titleTotal),
    ],
  );

  List<dynamic>? _xAxis;
  List<dynamic>? _yAxis;
  List<double> _axis = [];
  List<dynamic> _weigthChart = [];
  List<dynamic> _heightChart = [];

  List<int>? _agesInMonths;
  bool _isLoading = false;
  List<String> get listOfTabs => _listOfTabs;
  PreferredSizeWidget get tabBar => _tabBar;
  bool get isLoading => _isLoading;
  List<dynamic>? get xAxis => _xAxis;
  List<dynamic>? get yAxis => _yAxis;
  List<dynamic>? get weigthChart => _weigthChart;
  List<dynamic>? get heightChart => _heightChart;

  List<double> get axis => _axis;

  ChartsController() {
    _init();
  }

  void restart() {
    _xAxis = null;
    _yAxis = null;
  }

  void _init() async {}

  void switchChart(String tab) {
    switch (tab) {
      case AppConstants.titleWeight:
        _weigthChart.clear();
        chart(8, _weigthChart);
      case AppConstants.titleHeigth:
        _heightChart.clear();
        chart(9, _heightChart);
      case AppConstants.titleDiagnosis:
        chartDiagnosis(11);
      case AppConstants.titleDesnutrition:
        print(_sheetsRepository.get(2));
      case AppConstants.titleTotal:
        print(_sheetsRepository.get(12));
    }
  }

  void chartDiagnosis(int column) async {
    _isLoading = true;
    notify();
    final x = await agesPresentation();
    final y = await axisPresentation(column, []);

    _xAxis = x;
    _yAxis = y;

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

  double maxY() {
    double max = 0;
    _yAxis!.forEach((e) {
      if (e > max) max = e;
    });
    return max;
  }

  Future<List> axisPresentation(int column, List l) async {
    List<int> x = [];
    List<double> y = [];
    await _sheetsRepository.get(column).then((value) {
      for (int i = 1; i < value.length; i++) {
        y.add(double.parse(value[i]));
      }
    });
    await _sheetsRepository.get(7).then((value) {
      for (int i = 1; i < value.length; i++) {
        x.add(int.parse(value[i]));
      }
    });

    await chartPresentation(x, y, l);

    return y;
  }

  Future<List> agesPresentation() async {
    List<int> x = [0, 0, 0, 0, 0];
    await _sheetsRepository.get(7).then((value) {
      for (int i = 1; i < value.length; i++) {
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
    for (int i = 1; i < ages.length; i++) {
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

    for (int i = 0; i < p.length; i++) {
      if (x[i] != 0) {
        p[i] = double.parse((double.parse(y[i].toString()) / x[i]).toString());
      } else {
        p[i] = 0;
      }
      _axis.add(p[i]);
      listPresentation.add(p[i]);
    }
    // listPresentation.addAll(_axis);

    return p;
  }
}
