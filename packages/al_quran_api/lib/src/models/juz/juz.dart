import 'package:al_quran_api/src/models/ayah/ayah.dart';
import 'package:al_quran_api/src/static/hive.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
