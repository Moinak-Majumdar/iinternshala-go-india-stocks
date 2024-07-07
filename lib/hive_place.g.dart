// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_place.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HivePlaceAdapter extends TypeAdapter<HivePlace> {
  @override
  final int typeId = 1;

  @override
  HivePlace read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HivePlace(
      country: fields[1] as String,
      dayOrNight: fields[4] as String,
      description: fields[3] as String,
      humidity: fields[9] as String,
      weather: fields[2] as String,
      placeName: fields[0] as String,
      pressure: fields[8] as String,
      temp: fields[5] as String,
      tempMax: fields[7] as String,
      tempMin: fields[6] as String,
      visibility: fields[10] as String,
      windSpeed: fields[11] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HivePlace obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.placeName)
      ..writeByte(1)
      ..write(obj.country)
      ..writeByte(2)
      ..write(obj.weather)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.dayOrNight)
      ..writeByte(5)
      ..write(obj.temp)
      ..writeByte(6)
      ..write(obj.tempMin)
      ..writeByte(7)
      ..write(obj.tempMax)
      ..writeByte(8)
      ..write(obj.pressure)
      ..writeByte(9)
      ..write(obj.humidity)
      ..writeByte(10)
      ..write(obj.visibility)
      ..writeByte(11)
      ..write(obj.windSpeed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HivePlaceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
