---
to: test/widget/screens/<%= h.changeCase.snake(name) %>_test.dart
---
import 'package:al_quran/ui/screens/<%= h.changeCase.snake(name) %>/<%= h.changeCase.snake(name) %>.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_test/hive_test.dart';

import '../../helper/tester_extensions.dart';

@pragma('vm:entry-point')
void main() {
  setUp(() async {
    await setUpTestHive();
    await Hive.openBox('app');
  });

  tearDown(() async {
    await Hive.close();
    await tearDownTestHive();
  });

  testWidgets('📱 <%=h.changeCase.pascal(name)%>Screen Tests', (WidgetTester tester) async {
    await tester.runWidgetTestZoned(go);
  });
}

Future<void> init(WidgetTester tester) async {
  await tester.createRootWidgetAndPump(body: <%=h.changeCase.pascal(name)%>Screen());
}

Future<void> go(WidgetTester tester) async {
  await init(tester);
  await tester.pumpAndSettle();

  // Write test cases here
}
