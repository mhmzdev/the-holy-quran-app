import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';

class AppProvider extends ChangeNotifier {
  final _hive = Hive.box('app');

  int _first = 0;

  int get checkVisit => _first;

  bool init() {
    int? visit = _hive.get('visit');
    if (visit == null || visit == 0) {
      _hive.put('visit', 1);
      return true;
    }
    return false;
  }

  void visited() {
    _first = 1;

    notifyListeners();
  }
}
