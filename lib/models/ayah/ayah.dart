import 'dart:convert';

import 'package:hive/hive.dart';

part 'ayah.g.dart';

@HiveType(typeId: 0)
class Ayah {
  @HiveField(0)
  final num? number;
  @HiveField(1)
  final String? text;
  Ayah({
    this.number,
    this.text,
  });

  Ayah copyWith({
    num? number,
    String? text,
  }) {
    return Ayah(
      number: number ?? number,
      text: text ?? text,
    );
  }

  Ayah merge(Ayah model) {
    return Ayah(
      number: model.number ?? number,
      text: model.text ?? text,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'text': text,
    };
  }

  factory Ayah.fromMap(Map<String, dynamic> map) {
    return Ayah(
      number: map['number'],
      text: map['text'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Ayah.fromJson(String source) => Ayah.fromMap(json.decode(source));

  @override
  String toString() => 'Ayah(number: $number, text: $text)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Ayah && other.number == number && other.text == text;
  }

  @override
  int get hashCode => number.hashCode ^ text.hashCode;
}
