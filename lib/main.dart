import 'package:al_quran/services/locator.dart';
import 'package:al_quran_api/al_quran_api.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // hive
  await Hive.initFlutter();

  Hive.registerAdapter<Juz>(JuzAdapter());
  Hive.registerAdapter<Ayah>(AyahAdapter());
  Hive.registerAdapter<Chapter>(ChapterAdapter());

  await Future.wait([Hive.openBox('app'), Hive.openBox('data')]);

  // locator
  await initServiceLocator();

  runApp(const MyApp());
}
