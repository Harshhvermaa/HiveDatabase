// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class notesModelAdapter extends TypeAdapter<notesModel> {
  @override
  final int typeId = 1;

  @override
  notesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return notesModel(
      Title: fields[0] as String,
      Description: fields[1] as String,
      current_Time: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, notesModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.Title)
      ..writeByte(1)
      ..write(obj.Description)
      ..writeByte(2)
      ..write(obj.current_Time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is notesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
