import 'dart:async';

import 'package:al_quran/blocs/bookmarks/cubit.dart';
import 'package:al_quran/blocs/chapter/cubit.dart';
import 'package:al_quran/blocs/juz/cubit.dart';
import 'package:al_quran/providers/app_provider.dart';
import 'package:al_quran/router/router.dart';
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
    JuzCubit? juzCubit,
    ChapterCubit? chapterCubit,
    BookmarkCubit? bookmarkCubit,

    // Provider
    AppProvider? appProvider,
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
        BlocProvider(create: (_) => juzCubit ?? JuzCubit()),
        BlocProvider(create: (_) => chapterCubit ?? ChapterCubit()),
        BlocProvider(create: (_) => bookmarkCubit ?? BookmarkCubit()),

        /// Providers
        ChangeNotifierProvider(create: (_) => appProvider ?? AppProvider()),
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
  }) {
    return runZoned(
      () async {
        initialise(
          physicalSize: physicalSize,
          devicePixelRatio: devicePixelRatio,
        );
        await body(this);
      },
      zoneValues: {
        /// TODO: later after notification
        // #LocalNotification: FakeLocalNotification(),
        // #FakeAppFCM: FakeAppFcm(),
      },
    );
  }
}
