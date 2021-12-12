// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surah_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SurahsListAdapter extends TypeAdapter<SurahsList> {
  @override
  final int typeId = 5;

  @override
  SurahsList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SurahsList(
      surahs: (fields[0] as List?)?.cast<Surah>(),
    );
  }

  @override
  void write(BinaryWriter writer, SurahsList obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.surahs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SurahsListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
