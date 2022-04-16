import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import 'package:al_quran/models/ayah/ayah.dart';

part 'chapter.g.dart';

@HiveType(typeId: 1)
class Chapter {
  @HiveField(0)
  final int? number;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? englishName;
  @HiveField(3)
  final String? englishNameTranslation;
  @HiveField(4)
  final String? revelationType;
  @HiveField(5)
  final List<Ayah?>? ayahs;
  Chapter({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.revelationType,
    this.ayahs,
  });

  Chapter copyWith({
    int? number,
    String? name,
    String? englishName,
    String? englishNameTranslation,
    String? revelationType,
    List<Ayah?>? ayahs,
  }) {
    return Chapter(
      number: number ?? this.number,
      name: name ?? this.name,
      englishName: englishName ?? this.englishName,
      englishNameTranslation:
          englishNameTranslation ?? this.englishNameTranslation,
      revelationType: revelationType ?? this.revelationType,
      ayahs: ayahs ?? this.ayahs,
    );
  }

  Chapter merge(Chapter model) {
    return Chapter(
      number: model.number ?? number,
      name: model.name ?? name,
      englishName: model.englishName ?? englishName,
      englishNameTranslation:
          model.englishNameTranslation ?? englishNameTranslation,
      revelationType: model.revelationType ?? revelationType,
      ayahs: model.ayahs ?? ayahs,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'name': name,
      'englishName': englishName,
      'englishNameTranslation': englishNameTranslation,
      'revelationType': revelationType,
      'ayahs': ayahs?.map((x) => x?.toMap()).toList(),
    };
  }

  factory Chapter.fromMap(Map<String, dynamic> map) {
    return Chapter(
      number: map['number'],
      name: map['name'],
      englishName: map['englishName'],
      englishNameTranslation: map['englishNameTranslation'],
      revelationType: map['revelationType'],
      ayahs: List<Ayah>.from(map['ayahs']?.map((x) => Ayah.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Chapter.fromJson(String source) =>
      Chapter.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Chapter(number: $number, name: $name, englishName: $englishName, englishNameTranslation: $englishNameTranslation, revelationType: $revelationType, ayahs: $ayahs)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Chapter &&
        other.number == number &&
        other.name == name &&
        other.englishName == englishName &&
        other.englishNameTranslation == englishNameTranslation &&
        other.revelationType == revelationType &&
        listEquals(other.ayahs, ayahs);
  }

  @override
  int get hashCode {
    return number.hashCode ^
        name.hashCode ^
        englishName.hashCode ^
        englishNameTranslation.hashCode ^
        revelationType.hashCode ^
        ayahs.hashCode;
  }
}
