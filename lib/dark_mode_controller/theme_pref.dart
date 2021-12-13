import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class DarkThemePref {
  static const themeStatus = "THEMESTATUS";

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(themeStatus, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(themeStatus) as FutureOr<bool>? ?? false;
  }
}
