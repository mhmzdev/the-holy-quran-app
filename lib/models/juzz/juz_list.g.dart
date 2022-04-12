// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'juz_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JuzListAdapter extends TypeAdapter<JuzList> {
  @override
  final int typeId = 1;

  @override
  JuzList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return JuzList(
      juzAyahs: (fields[1] as List?)?.cast<JuzAyahs>(),
      juzNumber: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, JuzList obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.juzNumber)
      ..writeByte(1)
      ..write(obj.juzAyahs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JuzListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
