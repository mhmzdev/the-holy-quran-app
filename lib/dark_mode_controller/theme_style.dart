import 'package:flutter/material.dart';

class ThemeStyles {
  static ThemeData themeData(bool isDarkTheme, BuildContext buildContext) {
    return isDarkTheme
        ? ThemeData(
            primaryColor: Colors.black,
            brightness: Brightness.dark,
            backgroundColor: const Color(0xFF212121),
            dividerColor: Colors.black12,
            fontFamily: 'Poppins',
            textTheme: const TextTheme(
              headline1: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.w600,
              ),
              headline2: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
              bodyText1: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              caption: TextStyle(fontSize: 14),
            ),
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.grey,
              brightness: Brightness.light,
            ).copyWith(
              secondary: const Color(0xff896277),
              brightness: Brightness.dark,
            ),
          )
        : ThemeData(
            fontFamily: 'Poppins',
            primaryColor: const Color(0xffee8f8b),
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            dividerColor: Colors.white60,
            textTheme: const TextTheme(
              headline1: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.w600,
              ),
              headline2: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
              bodyText1: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              caption: TextStyle(fontSize: 14),
            ),
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.grey,
              brightness: Brightness.light,
            ).copyWith(
              secondary: const Color(0xff896277),
              brightness: Brightness.light,
            ),
          );
  }
}
