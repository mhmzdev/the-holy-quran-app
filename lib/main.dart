import 'package:al_quran/view/homeScreen_view.dart';
import 'package:al_quran/view/sajda_view.dart';
import 'package:al_quran/view/surahIndex_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

final darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    accentColor: Color(0xff896277),
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
    fontFamily: 'Sogeo',
    textTheme: TextTheme(
        headline1: TextStyle(
            fontFamily: 'Sogeo', fontSize: 42, fontWeight: FontWeight.w600),
        headline2: TextStyle(
            fontFamily: 'Sogeo', fontSize: 28, fontWeight: FontWeight.w600),
        bodyText1: TextStyle(
            fontFamily: "Sogeo", fontSize: 18, fontWeight: FontWeight.w600),
        caption: TextStyle(fontFamily: "Sogeo", fontSize: 14)));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Al-Qur'an",
      theme: darkTheme,
      home: HomeScreen(),
      routes: {
        '/surahIndex': (context) => SurahIndex(),
        '/sajda': (context) => Sajda(),
      },
    );
  }
}
