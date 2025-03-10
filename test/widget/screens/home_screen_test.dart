import 'package:al_quran/services/locator.dart';
import 'package:al_quran/ui/screens/home/home_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_test/hive_test.dart';

import '../../helper/tester_extensions.dart';

void main() {
  setUp(() async {
    await setUpTestHive();
    await Future.wait([
      Hive.openBox('app'),
      Hive.openBox('data'),
    ]);

    initServiceLocator();
  });

  tearDown(() async {
    await Hive.close();
    await tearDownTestHive();
  });

  testWidgets('Home screen test', (tester) async {
    await tester.runWidgetTestZoned(go);
  });
}

Future<void> init(WidgetTester tester) async {
  await tester.createRootWidgetAndPump(
    body: const HomeScreen(),
  );
}

Future<void> go(WidgetTester tester) async {
  await init(tester);
  await tester.pumpAndSettle();

  // Ensure we have Surah, Juzz and Bookmarks buttons on home
  // and in drawer. Hence, they must be found 2 times each.
  expect(find.text('Surah Index'), findsNWidgets(2));
  expect(find.text('Juz Index'), findsNWidgets(2));
  expect(find.text('Bookmarks'), findsNWidgets(2));

  // We have drawer widget, hence testing a few items
  expect(find.text('Introduction'), findsOneWidget);
  expect(find.text('Share App'), findsOneWidget);
  expect(find.text('Dark Mode'), findsOneWidget);
}
