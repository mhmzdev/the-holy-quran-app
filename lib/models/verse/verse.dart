import 'dart:convert';

import 'package:hive/hive.dart';

part 'verse.g.dart';

@HiveType(typeId: 2)
class Verse {
  @HiveField(0)
  final num? id;
  @HiveField(1)
  final String? textIndopak;
  Verse({
    this.id,
    this.textIndopak,
  });

  Verse copyWith({
    num? id,
    String? textIndopak,
  }) {
    return Verse(
      id: id ?? this.id,
      textIndopak: textIndopak ?? this.textIndopak,
    );
  }

  Verse merge(Verse model) {
    return Verse(
      id: model.id ?? id,
      textIndopak: model.textIndopak ?? textIndopak,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text_indopak': textIndopak,
    };
  }

  factory Verse.fromMap(Map<String, dynamic> map) {
    return Verse(
      id: map['id'],
      textIndopak: map['text_indopak'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Verse.fromJson(String source) => Verse.fromMap(json.decode(source));

  @override
  String toString() => 'Verse(id: $id, text_indopak: $textIndopak)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Verse && other.id == id && other.textIndopak == textIndopak;
  }

  @override
  int get hashCode => id.hashCode ^ textIndopak.hashCode;
}
