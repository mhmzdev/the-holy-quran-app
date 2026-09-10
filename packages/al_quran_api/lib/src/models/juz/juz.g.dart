// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'juz.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JuzAdapter extends TypeAdapter<_Juz> {
  @override
  final typeId = 2;

  @override
  _Juz read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _Juz(
      number: (fields[0] as num?)?.toInt(),
      ayahs: (fields[1] as List?)?.cast<Ayah?>(),
    );
  }

  @override
  void write(BinaryWriter writer, _Juz obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.ayahs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JuzAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Juz _$JuzFromJson(Map<String, dynamic> json) => _Juz(
  number: (json['number'] as num?)?.toInt(),
  ayahs: (json['ayahs'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Ayah.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$JuzToJson(_Juz instance) => <String, dynamic>{
  'number': instance.number,
  'ayahs': instance.ayahs?.map((e) => e?.toJson()).toList(),
};
