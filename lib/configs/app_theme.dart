import 'package:flutter/material.dart';

import 'app_core_theme.dart';

class AppTheme {
  static final _core = AppCoreTheme(
    accent: const Color(0xffee8f8b),
    primary: const Color(0xff5BA897),
    primaryDark: const Color(0xff896277),
    shadow: Colors.black.withOpacity(0.20),
    shadowSub: Colors.black.withOpacity(0.12),
    text: const Color.fromARGB(255, 255, 255, 255),
  );

  static AppCoreTheme light = _core.copyWith(
    background: Colors.white,
    backgroundSub: const Color(0xffF0F0F0),
    scaffold: const Color(0xfffefefe),
    scaffoldDark: const Color(0xfffcfcfc),
    text: Colors.black87,
    textSub: const Color.fromARGB(221, 78, 78, 78),
    textSub2: const Color.fromARGB(221, 121, 121, 121),
  );

  static AppCoreTheme dark = _core.copyWith(
    scaffold: const Color(0xff0e0e0e),
    background: const Color(0xFF212121),
    backgroundSub: const Color(0xff1c1c1e),
    text: Colors.white70,
    textSub: Colors.white70,
    textSub2: Colors.white70,
  );

  static AppCoreTheme? c;

  // Init
  static init(BuildContext context) {
    c = isDark(context) ? dark : light;
  }

  static bool isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;
}
