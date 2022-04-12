import 'package:al_quran/dark_mode_controller/theme_provider.dart';
import 'package:al_quran/dark_mode_controller/theme_style.dart';
import 'package:al_quran/models/ayat/ayat.dart';
import 'package:al_quran/models/juzz/juz.dart';
import 'package:al_quran/models/juzz/juz_list.dart';
import 'package:al_quran/models/sajda/sajda.dart';
import 'package:al_quran/models/sajda/sajda_list.dart';
import 'package:al_quran/models/surah/surah.dart';
import 'package:al_quran/models/surah/surah_list.dart';
import 'package:al_quran/screens/config/help.dart';
import 'package:al_quran/screens/config/introduction.dart';
import 'package:al_quran/screens/config/share_app.dart';
import 'package:al_quran/screens/home/home_screen.dart';
import 'package:al_quran/screens/juz/juz_index_screen.dart';
import 'package:al_quran/screens/sajda/sajda_screen.dart';
import 'package:al_quran/screens/surah/surah_index_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? initScreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);

  // hive
  await Hive.initFlutter();

  // hive adapter
  Hive.registerAdapter<Ayat>(AyatAdapter());

  Hive.registerAdapter<JuzList>(JuzListAdapter());
  Hive.registerAdapter<JuzAyahs>(JuzAyahsAdapter());

  Hive.registerAdapter<SajdaList>(SajdaListAdapter());
  Hive.registerAdapter<SajdaAyat>(SajdaAyatAdapter());

  Hive.registerAdapter<SurahsList>(SurahsListAdapter());
  Hive.registerAdapter<Surah>(SurahAdapter());

  // box
  await Hive.openBox('data');

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider darkThemeProvider = DarkThemeProvider();

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  void getCurrentAppTheme() async {
    darkThemeProvider.darkTheme =
        await darkThemeProvider.darkThemePref.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return ChangeNotifierProvider(create: (_) {
      return darkThemeProvider;
    }, child: Consumer<DarkThemeProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return MaterialApp(
          title: "They Holy Qur'an",
          debugShowCheckedModeBanner: false,
          theme: ThemeStyles.themeData(darkThemeProvider.darkTheme, context),
          home: Builder(
            builder: (context) => HomeScreen(
              maxSlide: MediaQuery.of(context).size.width * 0.835,
            ),
          ),
          initialRoute: initScreen == 0 || initScreen == null
              ? '/introduction'
              : '/homeScreen',
          routes: <String, WidgetBuilder>{
            '/homeScreen': (context) => HomeScreen(
                  maxSlide: MediaQuery.of(context).size.width * 0.835,
                ),
            '/surahIndex': (context) => const SurahIndexScreen(),
            '/sajda': (context) => const SajdaScreen(),
            '/juzIndex': (context) => const JuzIndexScreen(),
            '/introduction': (context) => OnBoardingCard(),
            '/help': (context) => const Help(),
            '/shareApp': (context) => const ShareApp()
          },
        );
      },
    ));
  }
}
