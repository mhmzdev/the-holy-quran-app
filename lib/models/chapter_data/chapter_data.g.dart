// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChapterDataAdapter extends TypeAdapter<ChapterData> {
  @override
  final int typeId = 0;

  @override
  ChapterData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChapterData(
      id: fields[0] as num?,
      revelationPlace: fields[1] as String?,
      nameSimple: fields[2] as String?,
      nameArabic: fields[3] as String?,
      verseCount: fields[4] as num?,
      translatedName: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ChapterData obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.revelationPlace)
      ..writeByte(2)
      ..write(obj.nameSimple)
      ..writeByte(3)
      ..write(obj.nameArabic)
      ..writeByte(4)
      ..write(obj.verseCount)
      ..writeByte(5)
      ..write(obj.translatedName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChapterDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
