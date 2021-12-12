import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:al_quran/model/surah/surah.dart';

part 'surah_list.g.dart';

@HiveType(typeId: 5)
class SurahsList {
  @HiveField(0)
  final List<Surah>? surahs;

  SurahsList({
    this.surahs,
  });

  factory SurahsList.fromJSON(Map<String, dynamic> json) {
    Iterable surahlist = json['data']['surahs'];
    List<Surah> surahsList = surahlist.map((i) => Surah.fromJSON(i)).toList();

    return SurahsList(surahs: surahsList);
  }

  SurahsList copyWith({
    List<Surah>? surahs,
  }) {
    return SurahsList(
      surahs: surahs ?? this.surahs,
    );
  }

  SurahsList merge(SurahsList model) {
    return SurahsList(
      surahs: model.surahs ?? surahs,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'surahs': surahs?.map((x) => x.toMap()).toList(),
    };
  }

  factory SurahsList.fromMap(Map<String, dynamic> map) {
    return SurahsList(
      surahs: List<Surah>.from(map['surahs']?.map((x) => Surah?.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory SurahsList.fromJson(String source) =>
      SurahsList.fromMap(json.decode(source));

  @override
  String toString() => 'SurahsList(surahs: $surahs)';
}
