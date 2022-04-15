import 'dart:convert';

class ChapterData {
  final num? id;
  final String? revelationPlace;
  final String? nameSimple;
  final String? nameArabic;
  final num? verseCount;
  final String? translatedName;
  ChapterData({
    this.id,
    this.revelationPlace,
    this.nameSimple,
    this.nameArabic,
    this.verseCount,
    this.translatedName,
  });

  ChapterData copyWith({
    num? id,
    String? revelationPlace,
    String? nameSimple,
    String? nameArabic,
    num? verseCount,
    String? translatedName,
  }) {
    return ChapterData(
      id: id ?? this.id,
      revelationPlace: revelationPlace ?? this.revelationPlace,
      nameSimple: nameSimple ?? this.nameSimple,
      nameArabic: nameArabic ?? this.nameArabic,
      verseCount: verseCount ?? this.verseCount,
      translatedName: translatedName ?? this.translatedName,
    );
  }

  ChapterData merge(ChapterData model) {
    return ChapterData(
      id: model.id ?? id,
      revelationPlace: model.revelationPlace ?? revelationPlace,
      nameSimple: model.nameSimple ?? nameSimple,
      nameArabic: model.nameArabic ?? nameArabic,
      verseCount: model.verseCount ?? verseCount,
      translatedName: model.translatedName ?? translatedName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'revelation_place': revelationPlace,
      'name_simple': nameSimple,
      'name_arabic': nameArabic,
      'verses_count': verseCount,
      'translated_name': translatedName,
    };
  }

  factory ChapterData.fromMap(Map<String, dynamic> map) {
    return ChapterData(
      id: map['id'],
      revelationPlace: map['revelation_place'],
      nameSimple: map['name_simple'],
      nameArabic: map['name_arabic'],
      verseCount: map['verses_count'],
      translatedName: map['translated_name']['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ChapterData.fromJson(String source) =>
      ChapterData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChapterInfo(id: $id, revelation_place: $revelationPlace, name_simple: $nameSimple, name_arabic: $nameArabic, verses_count: $verseCount, translated_name: $translatedName)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChapterData &&
        other.id == id &&
        other.revelationPlace == revelationPlace &&
        other.nameSimple == nameSimple &&
        other.nameArabic == nameArabic &&
        other.verseCount == verseCount &&
        other.translatedName == translatedName;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        revelationPlace.hashCode ^
        nameSimple.hashCode ^
        nameArabic.hashCode ^
        verseCount.hashCode ^
        translatedName.hashCode;
  }
}
