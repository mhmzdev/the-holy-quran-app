// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ayah.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AyahAdapter extends TypeAdapter<_Ayah> {
  @override
  final typeId = 0;

  @override
  _Ayah read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _Ayah(
      number: (fields[0] as num?)?.toInt(),
      text: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _Ayah obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.text);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AyahAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Ayah _$AyahFromJson(Map<String, dynamic> json) => _Ayah(
  number: (json['number'] as num?)?.toInt(),
  text: json['text'] as String?,
);

Map<String, dynamic> _$AyahToJson(_Ayah instance) => <String, dynamic>{
  'number': instance.number,
  'text': instance.text,
};
