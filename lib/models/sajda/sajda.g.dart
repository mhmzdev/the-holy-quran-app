// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sajda.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SajdaAyatAdapter extends TypeAdapter<SajdaAyat> {
  @override
  final int typeId = 4;

  @override
  SajdaAyat read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SajdaAyat(
      number: fields[0] as int?,
      sajdaNumber: fields[9] as int?,
      englishNameTranslation: fields[4] as String?,
      juzNumber: fields[6] as int?,
      manzilNumber: fields[7] as int?,
      revelationType: fields[5] as String?,
      rukuNumber: fields[8] as int?,
      surahEnglishName: fields[3] as String?,
      surahName: fields[2] as String?,
      text: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SajdaAyat obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.surahName)
      ..writeByte(3)
      ..write(obj.surahEnglishName)
      ..writeByte(4)
      ..write(obj.englishNameTranslation)
      ..writeByte(5)
      ..write(obj.revelationType)
      ..writeByte(6)
      ..write(obj.juzNumber)
      ..writeByte(7)
      ..write(obj.manzilNumber)
      ..writeByte(8)
      ..write(obj.rukuNumber)
      ..writeByte(9)
      ..write(obj.sajdaNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SajdaAyatAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
