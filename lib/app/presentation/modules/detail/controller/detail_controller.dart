import 'package:cecasem_nutricion_app/app/domain/repositories/firebase_repository.dart';

import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';

class DetailController extends SimpleNotifier {
  final _firebase = Get.find<FirebaseRepository>();

  final Map<String, dynamic> _map = {};
  bool _isLoading = false;

  Map<String, dynamic> get map => _map;
  bool get isLoading => _isLoading;

  DetailController() {
    _init();
  }

  void _init() async {
    _isLoading = true;
    await _firebase
        .searchDocument(router.arguments as String)
        .then((map) => _map.addAll(map));
    _isLoading = false;
    notify();
  }
}
