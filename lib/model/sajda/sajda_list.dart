import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import 'package:al_quran/model/sajda/sajda.dart';

part 'sajda_list.g.dart';

@HiveType(typeId: 3)
class SajdaList {
  @HiveField(0)
  final List<SajdaAyat>? sajdaAyahs;
  SajdaList({
    this.sajdaAyahs,
  });

  factory SajdaList.fromJSON(Map<String, dynamic> json) {
    Iterable allSajdas = json['data']['ayahs'];
    List<SajdaAyat> sajdas =
        allSajdas.map((e) => SajdaAyat.fromJSON(e)).toList();

    return SajdaList(sajdaAyahs: sajdas);
  }

  SajdaList copyWith({
    List<SajdaAyat>? sajdaAyahs,
  }) {
    return SajdaList(
      sajdaAyahs: sajdaAyahs ?? this.sajdaAyahs,
    );
  }

  SajdaList merge(SajdaList model) {
    return SajdaList(
      sajdaAyahs: model.sajdaAyahs ?? this.sajdaAyahs,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sajdaAyahs': sajdaAyahs?.map((x) => x.toMap()).toList(),
    };
  }

  factory SajdaList.fromMap(Map<String, dynamic> map) {
    print(map);
    return SajdaList(
      sajdaAyahs: List<SajdaAyat>.from(
          map['sajdaAyahs']?.map((x) => SajdaAyat?.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory SajdaList.fromJson(String source) =>
      SajdaList.fromMap(json.decode(source));

  @override
  String toString() => 'SajdaList(sajdaAyahs: $sajdaAyahs)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SajdaList && listEquals(o.sajdaAyahs, sajdaAyahs);
  }

  @override
  int get hashCode => sajdaAyahs.hashCode;
}
