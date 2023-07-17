import 'package:cecasem_nutricion_app/app/data/repositories_impl/sheets_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';

class SearchSurveyController extends SimpleNotifier {
  bool _isLoading = false;
  final SheetsRepositoryImpl _sheetsRepository = SheetsRepositoryImpl();
  final List<String> _listSearcheable = [];
  final Map<String, String> _mapNames = {};
  final TextEditingController _queryTextEditingController =
      TextEditingController();
  TextEditingController get queryTextEditingController =>
      _queryTextEditingController;
  bool get isLoading => _isLoading;
  List<String> get listSearcheable => _listSearcheable;

  SearchSurveyController() {
    _init();
  }

  void _init() async {
    await getListToSearch();
  }

  Future<void> getListToSearch() async {
    _isLoading = true;
    List<dynamic> names = await _sheetsRepository.get(4);
    List<dynamic> lastNames = await _sheetsRepository.get(5);

    for (int i = 0; i < names.length; i++) {
      String nameSearcheable = names[i].toString().trim().toLowerCase() +
          lastNames[i].toString().trim().toLowerCase();
      String namesToMap = '${names[i].toString()} ${lastNames[i]}';
      // _listSearcheable.add(nameSearcheable);
      _mapNames[nameSearcheable] = namesToMap;
    }
    _isLoading = false;
    notify();
  }

  void textOnChange(String? str) {
    var nameToSearch = str!.toLowerCase().replaceAll(r' ', '').trim();
    compareTo(nameToSearch);
  }

  void compareTo(String name) {
    _listSearcheable.clear();

    for (var element in _mapNames.keys) {
      if (element.contains(name)) {
        _listSearcheable.add(_mapNames[element]!);
      }
    }
    if (name.isEmpty) {
      _listSearcheable.clear();
    }
    notify();
  }
}
