import 'package:flutter/material.dart';

import 'app_theme.dart';

const fontFamily = 'Poppins';

final themeLight = ThemeData(
  fontFamily: fontFamily,
  useMaterial3: false,
  brightness: Brightness.light,
  dividerColor: Colors.white60,
  splashColor: Colors.transparent,
  primaryColor: const Color(0xffee8f8b),
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ThemeData.light()
      .colorScheme
      .copyWith(
        brightness: Brightness.light,
        primary: AppTheme.light.primary,
        surface: AppTheme.light.background,
      )
      .copyWith(surface: Colors.white),
);

final themeDark = ThemeData(
  fontFamily: fontFamily,
  useMaterial3: false,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  dividerColor: Colors.black12,
  splashColor: Colors.transparent,
  scaffoldBackgroundColor: Colors.grey[850],
  colorScheme: ThemeData.light()
      .colorScheme
      .copyWith(
        brightness: Brightness.dark,
        primary: AppTheme.light.primary,
        surface: AppTheme.light.background,
      )
      .copyWith(surface: const Color(0xFF212121)),
);
