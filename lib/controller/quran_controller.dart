import 'package:al_quran/model/juzz/juz_list.dart';
import 'package:al_quran/model/sajda/sajda_list.dart';
import 'package:al_quran/model/surah/surah_list.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class QuranAPI {
  static final _hiveBox = Hive.box('data');

  static Future<SurahsList> getSurahList() async {
    String url = "http://api.alquran.cloud/v1/quran/quran-uthmani";

    http.Response response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      // cache in Hive
      await _hiveBox.put(
        'surahList',
        SurahsList.fromJSON(
          json.decode(response.body),
        ),
      );

      return SurahsList.fromJSON(json.decode(response.body));
    } else {
      throw Exception("Failed  to Load Post");
    }
  }

  static Future<SajdaList> getSajda() async {
    String url = "http://api.alquran.cloud/v1/sajda/quran-uthmani";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // cache in Hive
      await _hiveBox.put(
        'sajdaList',
        SajdaList.fromJSON(
          json.decode(response.body),
        ),
      );

      return SajdaList.fromJSON(json.decode(response.body));
    } else {
      throw Exception("Failed  to Load Post");
    }
  }

  static Future<JuzList> getJuzz(int? index) async {
    String url = "http://api.alquran.cloud/v1/juz/$index/quran-uthmani";

    final response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      // cache in Hive
      await _hiveBox.put(
        'juzList$index',
        JuzList.fromJSON(
          json.decode(response.body),
        ),
      );

      return JuzList.fromJSON(json.decode(response.body));
    } else {
      throw Exception("Failed  to Load Post");
    }
  }
}
