import 'package:flutter/cupertino.dart';

class OnBoardingProvider extends ChangeNotifier {
  int _currentIndex = 0;

  int get index => _currentIndex;

  set index(int index) {
    _currentIndex = index;

    notifyListeners();
  }
}
