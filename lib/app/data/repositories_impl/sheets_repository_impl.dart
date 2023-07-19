import 'package:cecasem_nutricion_app/app/domain/models/sheets_column.dart';
import 'package:cecasem_nutricion_app/app/domain/repositories/sheets_repository.dart';
import 'package:cecasem_nutricion_app/app/utils/app_constants.dart';
import 'package:cecasem_nutricion_app/app/utils/sheets_credentials.dart';
import 'package:gsheets/gsheets.dart';

class SheetsRepositoryImpl extends SheetsRepository {
  final String _sheetId = SheetsCredentials.kGoogleSheetsId;
  static const String _sheetCredentials = AppConstants.kGoogleSheetsCredentials;
  static Worksheet? _userSheet;
  static final _gSheets = GSheets(_sheetCredentials);

  SheetsRepositoryImpl() {
    _init();
  }

  Future _init() async {
    try {
      final spreadsheet = await _gSheets.spreadsheet(_sheetId);

      _userSheet = await getWorksheet(
        spreadsheet,
        title: AppConstants.kNameGoogleSheetsData,
      );
      final firstRow = SheetsColumn.getColumns();
      _userSheet?.values.insertRow(1, firstRow);
    } catch (e) {
      Exception(e);
    }
  }

  @override
  Future<Worksheet> getWorksheet(Spreadsheet spreadsheet,
      {required String title}) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  @override
  Future insert(List<Map<String, dynamic>> rowList) async {
    _userSheet?.values.map.appendRows(rowList);
  }

  @override
  Future<List<dynamic>> get(int column) async {
    return await _userSheet!.values.column(column, fromRow: 2);
  }
}
