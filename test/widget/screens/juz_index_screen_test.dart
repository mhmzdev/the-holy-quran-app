import 'package:al_quran/services/locator.dart';
import 'package:al_quran/ui/screens/juz/juz_index_screen.dart';
import 'package:al_quran/utils/juz.dart';
import 'package:flutter/material.dart';
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

  testWidgets('Juz index screen test', (tester) async {
    await tester.runWidgetTestZoned(go);
  });
}

Future<void> init(WidgetTester tester) async {
  await tester.createRootWidgetAndPump(
    body: const JuzIndexScreen(),
  );
}

Future<void> go(WidgetTester tester) async {
  await init(tester);
  await tester.pumpAndSettle();

  final gridView = find.byType(GridView);
  final seenJuzNames = <String>{};
  var lastCount = 0;
  var stuckCounter = 0;

  // First pass - scroll through grid
  for (var i = 0; i < 15; i++) {
    // Get current visible items
    final currentCards = tester.widgetList<Card>(find.byType(Card));
    for (var card in currentCards) {
      // Extract juz name from the card
      final juzText = find
          .descendant(
            of: find.byWidget(card),
            matching: find.byType(Text),
          )
          .evaluate()
          .first
          .widget as Text;

      // Add juz name if it's in our known list
      if (JuzUtils.juzNames.contains(juzText.data)) {
        seenJuzNames.add(juzText.data!);
      }
    }

    // Check if we're stuck
    if (seenJuzNames.length == lastCount) {
      stuckCounter++;
      if (stuckCounter >= 3) {
        // Try alternating scroll directions when stuck
        final offset = stuckCounter % 2 == 0 ? -400.0 : 200.0;
        await tester.drag(gridView, Offset(0, offset));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 500));
      }
    } else {
      stuckCounter = 0;
    }

    lastCount = seenJuzNames.length;

    // Regular scroll
    await tester.drag(gridView, const Offset(0, -200));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pumpAndSettle();

    // Break early if we found all juz
    if (seenJuzNames.length >= JuzUtils.juzNames.length) break;
  }

  // Final report
  final missing =
      JuzUtils.juzNames.where((name) => !seenJuzNames.contains(name)).toList();

  debugPrint('Final juz count: ${seenJuzNames.length}');
  if (missing.isNotEmpty) {
    debugPrint('Missing juz: $missing');
  }

  expect(
    seenJuzNames.length,
    JuzUtils.juzNames.length,
    reason:
        'Expected ${JuzUtils.juzNames.length} juz, found ${seenJuzNames.length}. Missing: $missing',
  );
}
