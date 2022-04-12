// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sajda_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SajdaListAdapter extends TypeAdapter<SajdaList> {
  @override
  final int typeId = 3;

  @override
  SajdaList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SajdaList(
      sajdaAyahs: (fields[0] as List?)?.cast<SajdaAyat>(),
    );
  }

  @override
  void write(BinaryWriter writer, SajdaList obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.sajdaAyahs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SajdaListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
