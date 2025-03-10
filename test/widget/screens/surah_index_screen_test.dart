import 'package:al_quran/blocs/chapter/bloc.dart';
import 'package:al_quran/services/locator.dart';
import 'package:al_quran/ui/screens/surah/surah_index_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_test/hive_test.dart';

import '../../helper/mocks.dart';
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

  testWidgets('Surah index screen test', (tester) async {
    await tester.runWidgetTestZoned(go);
  });
}

Future<void> init(WidgetTester tester) async {
  await tester.createRootWidgetAndPump(
    body: BlocProvider(
      create: (context) => ChapterBloc(repo: sl())..emit(MockChapterState()),
      child: const SurahIndexScreen(),
    ),
  );
}

Future<void> go(WidgetTester tester) async {
  await init(tester);
  await tester.pumpAndSettle();

  final listView = find.byType(ListView);
  final seenChapterNumbers = <int>{};
  var lastCount = 0;
  var stuckCounter = 0;

  // First pass - small scrolls with progress tracking
  for (var i = 0; i < 30; i++) {
    // final beforeCount = seenChapterNumbers.length;

    // Get current visible items
    final currentTiles = tester.widgetList<SurahTile>(find.byType(SurahTile));
    for (var tile in currentTiles) {
      if (tile.chapter?.number != null) {
        seenChapterNumbers.add(tile.chapter!.number!);
      }
    }

    // Check if we're stuck and handle it
    if (seenChapterNumbers.length == lastCount) {
      stuckCounter++;
      if (stuckCounter >= 3) {
        // Try alternating scroll directions when stuck
        final offset = stuckCounter % 2 == 0 ? -800.0 : 400.0;
        await tester.drag(listView, Offset(0, offset));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 500));
      }
    } else {
      stuckCounter = 0;
    }

    lastCount = seenChapterNumbers.length;

    // Log progress if we found new chapters
    // if (seenChapterNumbers.length > beforeCount) {
    //   debugPrint('Found ${seenChapterNumbers.length} chapters after scroll $i');
    // }

    // Regular scroll
    await tester.drag(listView, const Offset(0, -200));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pumpAndSettle();

    // Break early if we found all chapters
    if (seenChapterNumbers.length >= 114) break;
  }

  // Second pass - larger scrolls if needed
  if (seenChapterNumbers.length < 114) {
    final beforeSecondPass = seenChapterNumbers.length;
    debugPrint('Starting second pass, found $beforeSecondPass chapters so far');

    for (var i = 0; i < 15 && seenChapterNumbers.length < 114; i++) {
      await tester.drag(listView, const Offset(0, -600));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 400));
      await tester.pumpAndSettle();

      final currentTiles = tester.widgetList<SurahTile>(find.byType(SurahTile));
      for (var tile in currentTiles) {
        if (tile.chapter?.number != null) {
          seenChapterNumbers.add(tile.chapter!.number!);
        }
      }

      // Scroll back up a bit if we're not finding new chapters
      if (seenChapterNumbers.length == lastCount) {
        await tester.drag(listView, const Offset(0, 300));
        await tester.pumpAndSettle();
      }
      lastCount = seenChapterNumbers.length;
    }
  }

  // Final report
  final missing = List.generate(114, (i) => i + 1)
      .where((i) => !seenChapterNumbers.contains(i))
      .toList();

  debugPrint('Final chapter count: ${seenChapterNumbers.length}');
  debugPrint('Missing chapters: $missing');

  expect(
    seenChapterNumbers.length,
    114,
    reason:
        'Expected 114 chapters, found ${seenChapterNumbers.length}. Missing: $missing',
  );
}
