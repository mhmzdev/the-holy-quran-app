// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ayat.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AyatAdapter extends TypeAdapter<Ayat> {
  @override
  final int typeId = 0;

  @override
  Ayat read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Ayat(
      text: fields[0] as String?,
      number: fields[1] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Ayat obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.number);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AyatAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
