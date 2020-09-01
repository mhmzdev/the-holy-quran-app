import 'package:al_quran/view/JuzIndex_view.dart';
import 'package:al_quran/view/homeScreen_view.dart';
import 'package:al_quran/view/otherViews/help.dart';
import 'package:al_quran/view/otherViews/introduction.dart';
import 'package:al_quran/view/otherViews/shareApp.dart';
import 'package:al_quran/view/sajdaIndex_view.dart';
import 'package:al_quran/view/surahIndex_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

int initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      home: Builder(
        builder: (context) => HomeScreen(
          maxSlide: MediaQuery.of(context).size.width * 0.835,
        ),
      ),
      initialRoute: initScreen == 0 || initScreen == null
          ? '/introduction'
          : '/homeScreen',
      routes: {
        '/introduction': (context) => OnBoardingCard(),
        '/homeScreen': (context) => HomeScreen(
              maxSlide: MediaQuery.of(context).size.width * 0.835,
            ),
        '/surahIndex': (context) => SurahIndex(),
        '/sajda': (context) => Sajda(),
        '/juzzIndex': (context) => JuzIndex(),
        '/help': (context) => Help(),
        '/shareApp': (context) => ShareApp()
      },
    );
  }
}
