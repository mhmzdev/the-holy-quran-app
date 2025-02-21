// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChapterAdapter extends TypeAdapter<_$ChapterImpl> {
  @override
  final int typeId = 1;

  @override
  _$ChapterImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$ChapterImpl(
      number: fields[0] as int?,
      name: fields[1] as String?,
      englishName: fields[2] as String?,
      englishNameTranslation: fields[3] as String?,
      revelationType: fields[4] as String?,
      ayahs: (fields[5] as List?)?.cast<Ayah?>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$ChapterImpl obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.englishName)
      ..writeByte(3)
      ..write(obj.englishNameTranslation)
      ..writeByte(4)
      ..write(obj.revelationType)
      ..writeByte(5)
      ..write(obj.ayahs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChapterImpl _$$ChapterImplFromJson(Map<String, dynamic> json) =>
    _$ChapterImpl(
      number: (json['number'] as num?)?.toInt(),
      name: json['name'] as String?,
      englishName: json['englishName'] as String?,
      englishNameTranslation: json['englishNameTranslation'] as String?,
      revelationType: json['revelationType'] as String?,
      ayahs: (json['ayahs'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Ayah.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ChapterImplToJson(_$ChapterImpl instance) =>
    <String, dynamic>{
      'number': instance.number,
      'name': instance.name,
      'englishName': instance.englishName,
      'englishNameTranslation': instance.englishNameTranslation,
      'revelationType': instance.revelationType,
      'ayahs': instance.ayahs?.map((e) => e?.toJson()).toList(),
    };
