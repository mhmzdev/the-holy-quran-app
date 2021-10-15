import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class DarkThemePref {
  static const THEME_STATUS = "THEMESTATUS";

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(THEME_STATUS) as FutureOr<bool>? ?? true;
  }
}
