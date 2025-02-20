import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:url_strategy/url_strategy.dart';

import 'package:al_quran/models/ayah/ayah.dart';
import 'package:al_quran/models/chapter/chapter.dart';
import 'package:al_quran/models/juz/juz.dart';

import 'app.dart';

void main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();

  // hive
  await Hive.initFlutter();

  Hive.registerAdapter<Juz>(JuzAdapter());
  Hive.registerAdapter<Ayah>(AyahAdapter());
  Hive.registerAdapter<Chapter>(ChapterAdapter());

  await Future.wait([
    Hive.openBox('app'),
    Hive.openBox('data'),
  ]);

  runApp(const MyApp());
}
