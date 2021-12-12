import 'dart:convert';

import 'package:hive/hive.dart';

part 'sajda.g.dart';

@HiveType(typeId: 4)
class SajdaAyat {
  @HiveField(0)
  final int? number;
  @HiveField(1)
  final String? text;
  @HiveField(2)
  final String? surahName;
  @HiveField(3)
  final String? surahEnglishName;
  @HiveField(4)
  final String? englishNameTranslation;
  @HiveField(5)
  final String? revelationType;
  @HiveField(6)
  final int? juzNumber;
  @HiveField(7)
  final int? manzilNumber;
  @HiveField(8)
  final int? rukuNumber;
  @HiveField(9)
  final int? sajdaNumber;

  SajdaAyat({
    this.number,
    this.text,
    this.surahName,
    this.surahEnglishName,
    this.englishNameTranslation,
    this.revelationType,
    this.juzNumber,
    this.manzilNumber,
    this.rukuNumber,
    this.sajdaNumber,
  });

  factory SajdaAyat.fromJSON(Map<String, dynamic> json) {
    return SajdaAyat(
        number: json['number'],
        text: json['text'],
        surahName: json['surah']['name'],
        surahEnglishName: json['surah']['englishName'],
        englishNameTranslation: json['surah']['englishNameTranslation'],
        juzNumber: json['juz'],
        manzilNumber: json['manzil'],
        rukuNumber: json['ruku'],
        revelationType: json['surah']['revelationType'],
        sajdaNumber: json['sajda']['id']);
  }

  SajdaAyat copyWith({
    int? number,
    String? text,
    String? surahName,
    String? surahEnglishName,
    String? englishNameTranslation,
    String? revelationType,
    int? juzNumber,
    int? manzilNumber,
    int? rukuNumber,
    int? sajdaNumber,
  }) {
    return SajdaAyat(
      number: number ?? this.number,
      text: text ?? this.text,
      surahName: surahName ?? this.surahName,
      surahEnglishName: surahEnglishName ?? this.surahEnglishName,
      englishNameTranslation:
          englishNameTranslation ?? this.englishNameTranslation,
      revelationType: revelationType ?? this.revelationType,
      juzNumber: juzNumber ?? this.juzNumber,
      manzilNumber: manzilNumber ?? this.manzilNumber,
      rukuNumber: rukuNumber ?? this.rukuNumber,
      sajdaNumber: sajdaNumber ?? this.sajdaNumber,
    );
  }

  SajdaAyat merge(SajdaAyat model) {
    return SajdaAyat(
      number: model.number ?? number,
      text: model.text ?? text,
      surahName: model.surahName ?? surahName,
      surahEnglishName: model.surahEnglishName ?? surahEnglishName,
      englishNameTranslation:
          model.englishNameTranslation ?? englishNameTranslation,
      revelationType: model.revelationType ?? revelationType,
      juzNumber: model.juzNumber ?? juzNumber,
      manzilNumber: model.manzilNumber ?? manzilNumber,
      rukuNumber: model.rukuNumber ?? rukuNumber,
      sajdaNumber: model.sajdaNumber ?? sajdaNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'text': text,
      'surahName': surahName,
      'surahEnglishName': surahEnglishName,
      'englishNameTranslation': englishNameTranslation,
      'revelationType': revelationType,
      'juzNumber': juzNumber,
      'manzilNumber': manzilNumber,
      'rukuNumber': rukuNumber,
      'sajdaNumber': sajdaNumber,
    };
  }

  factory SajdaAyat.fromMap(Map<String, dynamic> map) {
    return SajdaAyat(
      number: map['number'],
      text: map['text'],
      surahName: map['surahName'],
      surahEnglishName: map['surahEnglishName'],
      englishNameTranslation: map['englishNameTranslation'],
      revelationType: map['revelationType'],
      juzNumber: map['juzNumber'],
      manzilNumber: map['manzilNumber'],
      rukuNumber: map['rukuNumber'],
      sajdaNumber: map['sajdaNumber'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SajdaAyat.fromJson(String source) =>
      SajdaAyat.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SajdaAyat(number: $number, text: $text, surahName: $surahName, surahEnglishName: $surahEnglishName, englishNameTranslation: $englishNameTranslation, revelationType: $revelationType, juzNumber: $juzNumber, manzilNumber: $manzilNumber, rukuNumber: $rukuNumber, sajdaNumber: $sajdaNumber)';
  }
}
