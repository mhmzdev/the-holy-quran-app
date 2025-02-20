import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'router/routes.dart';

import 'configs/core_theme.dart' as theme;

// ui-imports-start
import 'ui/screens/home/home_screen.dart';
import 'ui/screens/juz/juz_index_screen.dart';
import 'ui/screens/onboarding/onboarding.dart';
import 'ui/screens/share_app/share_app.dart';
import 'ui/screens/splash/splash.dart';
import 'ui/screens/surah/surah_index_screen.dart';
import 'ui/screens/bookmarks/bookmarks_screen.dart';

// bloc-imports-start
import 'blocs/juz/cubit.dart';
import 'blocs/chapter/cubit.dart';
import 'blocs/bookmarks/cubit.dart';
// bloc-imports-end

// provider-imports-start
import 'providers/app_provider.dart';
import 'providers/onboarding_provider.dart';
// provider-imports-end

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
        // bloc-initiate-start
        BlocProvider(create: (_) => JuzCubit()),
        BlocProvider(create: (_) => ChapterCubit()),
        BlocProvider(create: (_) => BookmarkCubit()),
        // bloc-initiate-end

        // provider-initiate-start
        ChangeNotifierProvider(create: (_) => AppProvider()),
        ChangeNotifierProvider(create: (_) => OnBoardingProvider()),
        // provider-initiate-end
      ],
      child: Consumer<AppProvider>(
        builder: (context, state, child) {
          return _AppChild(
            state: state,
          );
        },
      ),
    );
  }
}

class _AppChild extends StatelessWidget {
  final AppProvider state;
  const _AppChild({
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'They Holy Qur\'an',
      debugShowCheckedModeBanner: false,
      theme: theme.themeLight,
      darkTheme: theme.themeDark,
      themeMode: state.themeMode,
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
