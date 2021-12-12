import 'package:al_quran/dark_mode_controller/theme_pref.dart';
import 'package:flutter/cupertino.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePref darkThemePref = DarkThemePref();

  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePref.setDarkTheme(value);

    notifyListeners();
  }
}
