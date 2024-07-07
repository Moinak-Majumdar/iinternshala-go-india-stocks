// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_place_names.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HivePlaceNamesAdapter extends TypeAdapter<HivePlaceNames> {
  @override
  final int typeId = 2;

  @override
  HivePlaceNames read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HivePlaceNames(
      placeNames: (fields[0] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, HivePlaceNames obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.placeNames);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HivePlaceNamesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
