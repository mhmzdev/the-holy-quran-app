import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

import 'package:al_quran/app_routes.dart';
import 'package:al_quran/cubits/bookmarks/cubit.dart';
import 'package:al_quran/cubits/chapter/cubit.dart';
import 'package:al_quran/cubits/juz/cubit.dart';
import 'package:al_quran/models/ayah/ayah.dart';
import 'package:al_quran/models/chapter/chapter.dart';
import 'package:al_quran/models/juz/juz.dart';
import 'package:al_quran/providers/app_provider.dart';
import 'package:al_quran/providers/onboarding_provider.dart';
import 'package:al_quran/ui/screens/bookmarks/bookmarks_screen.dart';
import 'package:al_quran/ui/screens/home/home_screen.dart';
import 'package:al_quran/ui/screens/juz/juz_index_screen.dart';
import 'package:al_quran/ui/screens/onboarding/onboarding.dart';
import 'package:al_quran/ui/screens/share_app/share_app.dart';
import 'package:al_quran/ui/screens/splash/splash.dart';
import 'package:al_quran/ui/screens/surah/surah_index_screen.dart';

import 'configs/core_theme.dart' as theme;

void main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();

  // hive
  await Hive.initFlutter();

  Hive.registerAdapter<Juz>(JuzAdapter());
  Hive.registerAdapter<Ayah>(AyahAdapter());
  Hive.registerAdapter<Chapter>(ChapterAdapter());

  await Future.wait([
    Hive.openBox('app'),
    Hive.openBox('data'),
  ]);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (_) => JuzCubit()),
        BlocProvider(create: (_) => ChapterCubit()),
        BlocProvider(create: (_) => BookmarkCubit()),
        ChangeNotifierProvider(create: (_) => AppProvider()),
        ChangeNotifierProvider(create: (_) => OnBoardingProvider()),
      ],
      child: Consumer<AppProvider>(
        builder: (context, value, child) {
          return MaterialChild(
            value: value,
          );
        },
      ),
    );
  }
}

class MaterialChild extends StatelessWidget {
  final AppProvider? value;
  const MaterialChild({
    super.key,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'They Holy Qur\'an',
      debugShowCheckedModeBanner: false,
      theme: theme.themeLight,
      darkTheme: theme.themeDark,
      themeMode: value!.themeMode,
      initialRoute: AppRoutes.splash,
      routes: <String, WidgetBuilder>{
        AppRoutes.juz: (context) => const JuzIndexScreen(),
        AppRoutes.splash: (context) => const SplashScreen(),
        AppRoutes.surah: (context) => const SurahIndexScreen(),
        AppRoutes.shareApp: (context) => const ShareAppScreen(),
        AppRoutes.bookmarks: (context) => const BookmarksScreen(),
        AppRoutes.onboarding: (context) => const OnboardingScreen(),
        AppRoutes.home: (context) =>
            HomeScreen(maxSlide: MediaQuery.of(context).size.width * 0.835),
      },
    );
  }
}
