import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internshala_go_india/getx_controller/place.dart';
import 'package:internshala_go_india/page/details.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:internshala_go_india/utils/weather_icon.dart';

class PrevPlaces extends StatelessWidget {
  const PrevPlaces({super.key});

  @override
  Widget build(context) {
    final textTheme = Theme.of(context).textTheme;
    final pc = Get.put(PlaceController());
    final places = pc.prevSearchPlaces;
    final placeNames = pc.prevSearchPlaceNames;

    return Column(
      children: [
        placeNames.isNotEmpty
            ? Text("Your places", style: textTheme.titleMedium)
            : const SizedBox(),
        const SizedBox(height: 16),
        SizedBox(
          height: MediaQuery.of(context).size.height * .6,
          child: placeNames.isEmpty
              ? Center(
                  child: Text(
                    'No previous saved place ..',
                    style: textTheme.titleLarge!.copyWith(
                      color: Colors.grey.shade900,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (final elm in placeNames)
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Details(placeName: elm),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white30,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      elm,
                                      style: textTheme.titleLarge!.copyWith(
                                        color: Colors.grey.shade800,
                                      ),
                                    ),
                                    Text(
                                      places[elm]!.country,
                                      style: textTheme.titleMedium!.copyWith(
                                        color: Colors.grey.shade600,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    BoxedIcon(
                                      genIconByWeather(
                                        places[elm]!.weather,
                                        places[elm]!.dayOrNight,
                                      ),
                                      size: 28,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      '${places[elm]!.temp}\u2103',
                                      style: textTheme.titleMedium!.copyWith(
                                        color: Colors.grey.shade800,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                    ],
                  ),
                ),
        ),
      ],
    );
  }
}
