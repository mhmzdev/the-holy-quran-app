import 'package:al_quran/blocs/bookmarks/bloc.dart';
import 'package:al_quran/blocs/chapter/bloc.dart';
import 'package:al_quran/blocs/juz/bloc.dart';
import 'package:al_quran/configs/app.dart';
import 'package:al_quran/providers/app_provider.dart';
import 'package:al_quran/providers/onboarding_provider.dart';
import 'package:al_quran/router/router.dart';
import 'package:al_quran/services/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:al_quran/configs/theme/core_theme.dart' as theme;

/// iPhone 16 pro
const defaultPhoneSize = Size(1206, 2622);

/// iPhone 16 pro
const double defaultDevicePixelRatio = 3;

typedef WidgetTestBody = Future<void> Function(WidgetTester tester);

extension WidgetTestExtensions on WidgetTester {
  /// Creates the main multi provider so that the any part of it can be substituted
  Future<MultiProvider> createRootWidgetAndPump({
    // Cubits
    JuzBloc? juzBloc,
    ChapterBloc? chapterBloc,
    BookmarksBloc? bookmarksBloc,

    // Provider
    AppProvider? appProvider,
    OnBoardingProvider? onboardingProvider,

    //
    Widget? body,

    /// For some reason `appRoutes` the global is not working
    /// so we are passing it as a parameter here.
    Map<String, Widget Function(dynamic)>? router,
    String? initialRoute,
  }) async {
    if (body != null && initialRoute != null) {
      throw ArgumentError('Cannot have both body and initialRoute');
    }

    // Note: these cubits have some default data. You can change them as needed, but make
    // sure this doesn't interfere with other tests that might be using the data
    final root = MultiProvider(
      providers: [
        /// Blocs
        BlocProvider(create: (_) => juzBloc ?? sl<JuzBloc>()),
        BlocProvider(create: (_) => chapterBloc ?? sl<ChapterBloc>()),
        BlocProvider(create: (_) => bookmarksBloc ?? sl<BookmarksBloc>()),

        /// Providers
        ChangeNotifierProvider(create: (_) => appProvider ?? AppProvider()),
        ChangeNotifierProvider(
          create: (_) => onboardingProvider ?? OnBoardingProvider(),
        ),
      ],
      child: Consumer<AppProvider>(
        builder: (context, state, child) {
          return MaterialApp(
            themeMode: state.themeMode,
            theme: theme.themeLight,
            darkTheme: theme.themeDark,
            initialRoute: initialRoute,
            home: initialRoute != null ? null : body,

            // can be replaced for testing
            routes: router ?? appRoutes,
            builder: (context, child) {
              App.init(context);
              return child!;
            },
          );
        },
      ),
    );
    await pumpWidget(root);
    return root;
  }

  /// Initalizes the tester for widget testing
  void initialise({
    Size physicalSize = defaultPhoneSize,
    double devicePixelRatio = defaultDevicePixelRatio,
  }) {
    WidgetController.hitTestWarningShouldBeFatal = true;

    view.physicalSize = physicalSize;
    view.devicePixelRatio = devicePixelRatio;
  }

  /// Initialize the test environment, and run the test with mocks
  Future<void> runWidgetTestZoned(
    WidgetTestBody body, {
    Size physicalSize = defaultPhoneSize,

    /// Fix this, pixel ratio is working different for different screen. Should be same i.e. 3
    double devicePixelRatio = defaultDevicePixelRatio,
  }) async {
    initialise(
      physicalSize: physicalSize,
      devicePixelRatio: devicePixelRatio,
    );
    await body(this);
  }
}
