import 'package:hive_flutter/hive_flutter.dart';
import 'package:internshala_go_india/hive_place.dart';
import 'package:internshala_go_india/hive_place_names.dart';
import 'package:internshala_go_india/model/place.dart';

const _Box1Name = 'PLACES';
const _Box2Name = 'Place_Keys';
const _Box2Id = '%-keys-%';

void savePlace(Map<String, PlaceModel> places) async {
  final placeBox = await Hive.openBox<HivePlace>(_Box1Name);
  final namesBox = await Hive.openBox<HivePlaceNames>(_Box2Name);
  final Map<String, HivePlace> hivePlaces = {};

  final keys = places.keys.toList();

  await namesBox.put(_Box2Id, HivePlaceNames(placeNames: keys));

  for (final name in keys) {
    hivePlaces[name] = HivePlace(
      country: places[name]!.country,
      dayOrNight: places[name]!.dayOrNight,
      description: places[name]!.description,
      humidity: places[name]!.humidity,
      weather: places[name]!.weather,
      placeName: name,
      pressure: places[name]!.pressure,
      temp: places[name]!.temp,
      tempMax: places[name]!.tempMax,
      tempMin: places[name]!.tempMin,
      visibility: places[name]!.visibility,
      windSpeed: places[name]!.windSpeed,
    );
  }

  await placeBox.putAll(hivePlaces);
}

Future<Map<String, PlaceModel>?> getSavedPlaces() async {
  final placeBox = await Hive.openBox<HivePlace>(_Box1Name);
  final namesBox = await Hive.openBox<HivePlaceNames>(_Box2Name);
  final Map<String, PlaceModel> places = {};

  if (namesBox.isEmpty) {
    return null;
  } else {
    final keys = namesBox.get(_Box2Id);
    if (keys != null) {
      for (final name in keys.placeNames) {
        final details = placeBox.get(name);
        if (details != null) {
          places[name] = PlaceModel(
            country: details.country,
            dayOrNight: details.dayOrNight,
            description: details.description,
            humidity: details.humidity,
            weather: details.weather,
            placeName: details.placeName,
            pressure: details.pressure,
            temp: details.temp,
            tempMax: details.tempMax,
            tempMin: details.tempMin,
            visibility: details.visibility,
            windSpeed: details.windSpeed,
          );
        }
      }
    }
    return places;
  }
}
