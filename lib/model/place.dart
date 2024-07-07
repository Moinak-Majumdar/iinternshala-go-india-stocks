class PlaceModel {
  const PlaceModel({
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

  final String country,
      dayOrNight,
      description,
      humidity,
      weather,
      placeName,
      pressure,
      temp,
      tempMax,
      tempMin,
      visibility,
      windSpeed;
}

// converts response json data to PlaceModel class.
class PlaceServerModel {
  const PlaceServerModel({required this.place});
  final PlaceModel place;

  factory PlaceServerModel.fromJson(Map<String, dynamic> json) {
    final weather = json['weather'][0];
    final main = json['main'];
    final wind = json['wind'];
    final sys = json['sys'];
    final visibility = json['visibility'] >= 10000
        ? '>10Km'
        : "${json['visibility'] / 1000}Km";
    String dayOrNight = 'day';

    if (weather['icon'].contains('n')) {
      dayOrNight = 'night';
    }

    return PlaceServerModel(
      place: PlaceModel(
        country: sys['country'],
        dayOrNight: dayOrNight,
        description: weather['description'],
        humidity: main['humidity'].toString(),
        placeName: json['name'],
        pressure: main['pressure'].toString(),
        temp: main['temp'].toString(),
        tempMax: main['temp_max'].toString(),
        tempMin: main['temp_min'].toString(),
        visibility: visibility,
        weather: weather['main'],
        windSpeed: wind['speed'].toString(),
      ),
    );
  }
}
