import 'package:al_quran/configs/app.dart';
import 'package:al_quran/services/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'router/routes.dart';
import 'router/router.dart';

import 'configs/theme/core_theme.dart' as theme;

// bloc-imports-start
import 'blocs/chapter/bloc.dart';
import 'blocs/juz/bloc.dart';
import 'blocs/bookmarks/bloc.dart';
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
        BlocProvider(create: (_) => sl<ChapterBloc>()),
        BlocProvider(create: (_) => sl<JuzBloc>()),
        BlocProvider(create: (_) => sl<BookmarksBloc>()),
        // bloc-initiate-end

        // provider-initiate-start
        ChangeNotifierProvider(create: (_) => AppProvider()),
        ChangeNotifierProvider(create: (_) => OnBoardingProvider()),
        // provider-initiate-end
      ],
      child: Consumer<AppProvider>(
        builder: (context, state, child) {
          return MaterialApp(
            title: 'They Holy Qur\'an',
            navigatorKey: navigator,
            debugShowCheckedModeBanner: false,
            theme: theme.themeLight,
            darkTheme: theme.themeDark,
            themeMode: state.themeMode,
            initialRoute: AppRoutes.splash,
            routes: appRoutes,
            builder: (context, child) {
              App.init(context);
              return child!;
            },
          );
        },
      ),
    );
  }
}
