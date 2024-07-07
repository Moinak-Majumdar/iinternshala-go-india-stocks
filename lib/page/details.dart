import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internshala_go_india/getx_controller/place.dart';
import 'package:internshala_go_india/utils/weather_icon.dart';
import 'package:weather_icons/weather_icons.dart';

class Details extends StatelessWidget {
  const Details({super.key, required this.placeName});
  final String placeName;

  @override
  Widget build(context) {
    final textTheme = Theme.of(context).textTheme;
    final pc = Get.put(PlaceController());
    final details = pc.prevSearchPlaces[placeName];

    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              margin: const EdgeInsets.symmetric(vertical: 32),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xff96c6ea),
                    Color(0xffb597f6),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${details!.placeName}, ${details.country}',
                    style: textTheme.titleLarge,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        genIconByWeather(
                          details.weather,
                          details.dayOrNight,
                        ),
                        size: 80,
                      ),
                      Column(
                        children: [
                          Text(
                            details.weather.toUpperCase(),
                            style: textTheme.displayMedium!.copyWith(
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            '${details.temp}\u2103',
                            style: textTheme.displaySmall,
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xff96c6ea),
                        Color(0xffb597f6),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        WeatherIcons.thermometer,
                        size: 32,
                      ),
                      Text(
                          'Min: ${details.tempMin}\u2103 \nMax: ${details.tempMax}\u2103')
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xff96c6ea),
                        Color(0xffb597f6),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        WeatherIcons.windy,
                        size: 32,
                      ),
                      const SizedBox(width: 8),
                      Text('${details.windSpeed} M/s')
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xff96c6ea),
                        Color(0xffb597f6),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        WeatherIcons.humidity,
                        size: 32,
                      ),
                      const SizedBox(width: 8),
                      Text('${details.humidity}%')
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xff96c6ea),
                        Color(0xffb597f6),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        WeatherIcons.barometer,
                        size: 32,
                      ),
                      const SizedBox(width: 8),
                      Text(details.pressure)
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xff96c6ea),
                    Color(0xffb597f6),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    WeatherIcons.direction_right,
                    size: 32,
                  ),
                  const SizedBox(width: 8),
                  Text('Visibility: ${details.visibility}')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
