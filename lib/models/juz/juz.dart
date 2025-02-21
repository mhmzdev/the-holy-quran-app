import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'package:al_quran/models/ayah/ayah.dart';
import 'package:al_quran/static/hive.dart';

part 'juz.freezed.dart';
part 'juz.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class Juz with _$Juz {
  const Juz._();

  @HiveType(
    typeId: AppHiveTypes.juz,
    adapterName: 'JuzAdapter',
  )
  const factory Juz({
    @HiveField(0) int? number,
    @HiveField(1) List<Ayah?>? ayahs,
  }) = _Juz;

  factory Juz.fromJson(Map<String, dynamic> json) => _$JuzFromJson(json);
}
