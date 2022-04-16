import 'package:flutter/material.dart';

import 'app_theme.dart';

const fontFamily = 'Poppins';

final themeLight = ThemeData(
  fontFamily: fontFamily,
  brightness: Brightness.light,
  backgroundColor: Colors.white,
  dividerColor: Colors.white60,
  splashColor: Colors.transparent,
  primaryColor: const Color(0xffee8f8b),
  scaffoldBackgroundColor: Colors.white,
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
    },
  ),
  colorScheme: ThemeData.light().colorScheme.copyWith(
        brightness: Brightness.light,
        primary: AppTheme.light.primary,
        background: AppTheme.light.background,
      ),
);

final themeDark = ThemeData(
  fontFamily: fontFamily,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  dividerColor: Colors.black12,
  splashColor: Colors.transparent,
  scaffoldBackgroundColor: Colors.grey[850],
  backgroundColor: const Color(0xFF212121),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
    },
  ),
  colorScheme: ThemeData.light().colorScheme.copyWith(
        brightness: Brightness.dark,
        primary: AppTheme.light.primary,
        background: AppTheme.light.background,
      ),
);
