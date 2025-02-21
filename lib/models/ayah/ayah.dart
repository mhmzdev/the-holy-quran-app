import 'package:al_quran/static/hive.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'ayah.freezed.dart';
part 'ayah.g.dart';

@freezed
class Ayah with _$Ayah {
  const Ayah._();

  @HiveType(
    typeId: AppHiveTypes.ayah,
    adapterName: 'AyahAdapter',
  )
  const factory Ayah({
    @HiveField(0) int? number,
    @HiveField(1) String? text,
  }) = _Ayah;

  factory Ayah.fromJson(Map<String, Object?> json) => _$AyahFromJson(json);
}
