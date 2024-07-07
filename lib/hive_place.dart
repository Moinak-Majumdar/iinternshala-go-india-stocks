import 'package:hive/hive.dart';

part 'hive_place.g.dart';

@HiveType(typeId: 1)
class HivePlace extends HiveObject {
  HivePlace({
    required this.country,
    required this.dayOrNight,
    required this.description,
    required this.humidity,
    required this.weather,
    required this.placeName,
    required this.pressure,
    required this.temp,
    required this.tempMax,
    required this.tempMin,
    required this.visibility,
    required this.windSpeed,
  });

  @HiveField(0)
  String placeName;
  @HiveField(1)
  String country;
  @HiveField(2)
  String weather;
  @HiveField(3)
  String description;
  @HiveField(4)
  String dayOrNight;
  @HiveField(5)
  String temp;
  @HiveField(6)
  String tempMin;
  @HiveField(7)
  String tempMax;
  @HiveField(8)
  String pressure;
  @HiveField(9)
  String humidity;
  @HiveField(10)
  String visibility;
  @HiveField(11)
  String windSpeed;
  // Hive fields go here
}
