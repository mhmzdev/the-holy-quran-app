import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:al_quran/models/ayah/ayah.dart';
import 'package:hive/hive.dart';

part 'juz.g.dart';

@HiveType(typeId: 2)
class Juz {
  @HiveField(0)
  final int? number;
  @HiveField(1)
  final List<Ayah?>? ayahs;
  Juz({
    this.number,
    this.ayahs,
  });

  Juz copyWith({
    int? number,
    List<Ayah?>? ayahs,
  }) {
    return Juz(
      number: number ?? this.number,
      ayahs: ayahs ?? this.ayahs,
    );
  }

  Juz merge(Juz model) {
    return Juz(
      number: model.number ?? number,
      ayahs: model.ayahs ?? ayahs,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'ayahs': ayahs?.map((x) => x?.toMap()).toList(),
    };
  }

  factory Juz.fromMap(Map<String, dynamic> map) {
    return Juz(
      number: map['number'],
      ayahs: List<Ayah>.from(map['ayahs']?.map((x) => Ayah.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Juz.fromJson(String source) => Juz.fromMap(json.decode(source));

  @override
  String toString() => 'Juz(number: $number, ayahs: $ayahs)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Juz &&
        other.number == number &&
        listEquals(other.ayahs, ayahs);
  }

  @override
  int get hashCode => number.hashCode ^ ayahs.hashCode;
}
