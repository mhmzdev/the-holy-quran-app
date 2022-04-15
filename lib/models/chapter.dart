import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:al_quran/models/verse.dart';

class Chapter {
  final List<Verse?>? verses;
  Chapter({
    this.verses,
  });

  Chapter copyWith({
    List<Verse?>? verses,
  }) {
    return Chapter(
      verses: verses ?? verses,
    );
  }

  Chapter merge(Chapter model) {
    return Chapter(
      verses: model.verses ?? verses,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'verses': verses?.map((x) => x?.toMap()).toList(),
    };
  }

  factory Chapter.fromMap(Map<String, dynamic> map) {
    return Chapter(
      verses: List<Verse>.from(map['verses']?.map((x) => Verse.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Chapter.fromJson(String source) =>
      Chapter.fromMap(json.decode(source));

  @override
  String toString() => 'Chapter(verses: $verses)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Chapter && listEquals(other.verses, verses);
  }

  @override
  int get hashCode => verses.hashCode;
}
