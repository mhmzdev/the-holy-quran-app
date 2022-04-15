import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:al_quran/models/juz/juz.dart';
import 'package:al_quran/models/ayah/ayah.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:al_quran/cubits/juz/cubit.dart';
import 'package:al_quran/cubits/quran/cubit.dart';
import 'package:al_quran/screens/config/help.dart';
import 'package:al_quran/cubits/chapter/cubit.dart';
import 'package:al_quran/screens/splash_screen.dart';
import 'package:al_quran/providers/app_provider.dart';
import 'package:al_quran/models/chapter/chapter.dart';
import 'package:al_quran/screens/config/share_app.dart';
import 'package:al_quran/screens/home/home_screen.dart';
import 'package:al_quran/screens/config/introduction.dart';
import 'package:al_quran/screens/juz/juz_index_screen.dart';
import 'package:al_quran/providers/theme/theme_provider.dart';
import 'package:al_quran/screens/surah/surah_index_screen.dart';
import 'configs/core_theme.dart' as theme;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // hive
  await Hive.initFlutter();

  Hive.registerAdapter<Juz>(JuzAdapter());
  Hive.registerAdapter<Ayah>(AyahAdapter());
  Hive.registerAdapter<Chapter>(ChapterAdapter());

  await Hive.openBox('app');
  await Hive.openBox('data');

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiProvider(
      providers: [
        BlocProvider(create: (_) => JuzCubit()),
        BlocProvider(create: (_) => QuranCubit()),
        BlocProvider(create: (_) => ChapterCubit()),
        ChangeNotifierProvider(create: (_) => AppProvider()),
        ChangeNotifierProvider(create: (_) => DarkThemeProvider()),
      ],
      child: MaterialApp(
        title: "They Holy Qur'an",
        debugShowCheckedModeBanner: false,
        theme: theme.themeLight,
        home: Builder(
          builder: (context) => HomeScreen(
            maxSlide: MediaQuery.of(context).size.width * 0.835,
          ),
        ),
        initialRoute: '/splash',
        routes: <String, WidgetBuilder>{
          '/help': (context) => const Help(),
          '/intro': (context) => OnBoardingCard(),
          '/shareApp': (context) => const ShareApp(),
          '/splash': (context) => const SplashScreen(),
          '/juzIndex': (context) => const JuzIndexScreen(),
          '/surahIndex': (context) => const SurahIndexScreen(),
          '/home': (context) =>
              HomeScreen(maxSlide: MediaQuery.of(context).size.width * 0.835),
        },
      ),
    );
  }
}
