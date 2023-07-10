import 'package:gsheets/gsheets.dart';

abstract class SheetsRepository {
  Future<Worksheet> getWorksheet(
    Spreadsheet spreadsheet, {
    required String title,
  });

  Future insert(List<Map<String, dynamic>> rowList);

  Future<List<dynamic>> get(int column);
}
