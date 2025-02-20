import 'package:flutter/material.dart';

// ui-imports-start
import 'package:al_quran/ui/screens/home/home_screen.dart';
import 'package:al_quran/ui/screens/juz/juz_index_screen.dart';
import 'package:al_quran/ui/screens/onboarding/onboarding.dart';
import 'package:al_quran/ui/screens/share_app/share_app.dart';
import 'package:al_quran/ui/screens/splash/splash.dart';
import 'package:al_quran/ui/screens/surah/surah_index_screen.dart';
import 'package:al_quran/ui/screens/bookmarks/bookmarks_screen.dart';

import 'routes.dart';

final navigator = GlobalKey<NavigatorState>();

final appRoutes = {
  AppRoutes.juz: (context) => const JuzIndexScreen(),
  AppRoutes.splash: (context) => const SplashScreen(),
  AppRoutes.surah: (context) => const SurahIndexScreen(),
  AppRoutes.shareApp: (context) => const ShareAppScreen(),
  AppRoutes.bookmarks: (context) => const BookmarksScreen(),
  AppRoutes.onboarding: (context) => const OnboardingScreen(),
  AppRoutes.home: (context) => const HomeScreen(),
};
