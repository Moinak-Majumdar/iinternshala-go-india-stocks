import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

IconData genIconByWeather(String weather, String dayOrNight) {
  switch (weather) {
    case "Clouds":
      return dayOrNight == 'day'
          ? WeatherIcons.day_cloudy
          : WeatherIcons.night_cloudy;
    case "Haze":
      return dayOrNight == 'day'
          ? WeatherIcons.day_haze
          : WeatherIcons.night_alt_cloudy_windy;
    case "Clear":
      return dayOrNight == 'day'
          ? WeatherIcons.day_sunny
          : WeatherIcons.night_clear;
    case "Tornado":
      return WeatherIcons.tornado;
    case "Sand":
      return WeatherIcons.cloudy_gusts;
    case "Rain":
      return dayOrNight == 'day'
          ? WeatherIcons.day_rain_mix
          : WeatherIcons.night_alt_rain_mix;
    case "Snow":
      return dayOrNight == 'day'
          ? WeatherIcons.day_snow_wind
          : WeatherIcons.night_snow_wind;
    case "Fog":
      return WeatherIcons.fog;
    case "Dust":
      return WeatherIcons.dust;
    case "Smoke":
      return WeatherIcons.smoke;
    case "Mist":
      return WeatherIcons.sprinkle;
    case "Drizzle":
      return dayOrNight == 'day'
          ? WeatherIcons.day_sleet
          : WeatherIcons.night_alt_sleet;
    case "Thunderstorm":
      return dayOrNight == 'day'
          ? WeatherIcons.day_thunderstorm
          : WeatherIcons.night_thunderstorm;
    default:
      return dayOrNight == 'day'
          ? WeatherIcons.day_sunny
          : WeatherIcons.night_clear;
  }
}
