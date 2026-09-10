import 'dart:io';

import 'package:hive_ce/hive.dart';

Directory? _dir;

/// Points Hive at a fresh temp directory so widget tests never touch real boxes.
Future<void> setUpTestHive() async {
  _dir = await Directory.systemTemp.createTemp('al_quran_hive_test_');
  Hive.init(_dir!.path);
}

/// Closes every open box and removes the temp directory created by [setUpTestHive].
Future<void> tearDownTestHive() async {
  await Hive.deleteFromDisk();
  await Hive.close();
  await _dir?.delete(recursive: true);
  _dir = null;
}
