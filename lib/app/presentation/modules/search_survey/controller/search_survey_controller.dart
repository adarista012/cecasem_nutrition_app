import 'package:cecasem_nutricion_app/app/domain/repositories/sheets_repository.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/search_survey/utils/to_key_for_map.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/search_survey/utils/to_searchable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';

class SearchSurveyController extends SimpleNotifier {
  final List<String> _listSearcheable = [];
  final Map<String, String> _mapNames = {};
  final Map<String, String> _mapIds = {};
  final TextEditingController _queryTextEditingController =
      TextEditingController();
  final _sheetsRepository = Get.find<SheetsRepository>();

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  List<String> get listSearcheable => _listSearcheable;
  TextEditingController get queryTextEditingController =>
      _queryTextEditingController;
  Map<String, String> get mapNames => _mapNames;
  Map<String, String> get mapIds => _mapIds;

  SearchSurveyController() {
    _init();
  }

  void _init() {
    getListToSearch();
  }

  void getListToSearch() async {
    _isLoading = true;

    List names = await _sheetsRepository.get(4);
    List lastNames = await _sheetsRepository.get(5);
    List ids = await _sheetsRepository.get(14);
    for (int i = 0; i < names.length; i++) {
      String key = toKeyForMap(names[i], lastNames[i]);
      String namesToMap = '${names[i]} ${lastNames[i]}';
      _mapNames[key] = namesToMap;
      _mapIds[namesToMap] = ids[i];
    }

    _isLoading = false;
    notify();
  }

  void textOnChange(String? str) {
    var nameToSearch = toSearcheableText(str!);
    compareTo(nameToSearch);
  }

  void compareTo(String name) {
    _listSearcheable.clear();

    for (var element in _mapNames.keys) {
      if (element.contains(name)) {
        _listSearcheable.add(_mapNames[element]!);
      }
    }
    if (name.isEmpty) _listSearcheable.clear();
    notify();
  }
}
