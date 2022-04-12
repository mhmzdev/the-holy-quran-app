// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'juz.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JuzAyahsAdapter extends TypeAdapter<JuzAyahs> {
  @override
  final int typeId = 2;

  @override
  JuzAyahs read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return JuzAyahs(
      ayahsText: fields[0] as String?,
      surahName: fields[2] as String?,
      ayahNumber: fields[1] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, JuzAyahs obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.ayahsText)
      ..writeByte(1)
      ..write(obj.ayahNumber)
      ..writeByte(2)
      ..write(obj.surahName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JuzAyahsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
