import 'dart:convert';

import 'package:hive/hive.dart';

part 'ayat.g.dart';

@HiveType(typeId: 0)
class Ayat {
  @HiveField(0)
  final String? text;

  @HiveField(1)
  final int? number;
  Ayat({
    this.text,
    this.number,
  });

  factory Ayat.fromJSON(Map<String, dynamic> json) {
    return Ayat(text: json['text'], number: json['numberInSurah']);
  }

  Ayat copyWith({
    String? text,
    int? number,
  }) {
    return Ayat(
      text: text ?? this.text,
      number: number ?? this.number,
    );
  }

  Ayat merge(Ayat model) {
    return Ayat(
      text: model.text ?? text,
      number: model.number ?? number,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'number': number,
    };
  }

  String toJson() => json.encode(toMap());

  factory Ayat.fromMap(Map<String, dynamic> map) {
    return Ayat(
      text: map['text'],
      number: map['number'],
    );
  }

  factory Ayat.fromJson(String source) => Ayat.fromMap(json.decode(source));

  @override
  String toString() => 'Ayat(text: $text, number: $number)';
}
