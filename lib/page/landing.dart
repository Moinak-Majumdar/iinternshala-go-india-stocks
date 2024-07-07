import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internshala_go_india/getx_controller/place.dart';
import 'package:internshala_go_india/utils/fetch_api.dart';
import 'package:internshala_go_india/widget/get_snack.dart';
import 'package:internshala_go_india/widget/prev_places.dart';
import 'package:lottie/lottie.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(context) {
    final pc = Get.put(PlaceController());

    void searchWeather(String placeName) async {
      if (placeName == '' || pc.loading.value == true) return;
      pc.loading.value = true;
      try {
        final weather = await fetchWeatherApi(placeName);
        pc.updatePlaceList(weather);
      } catch (e) {
        GetSnack.error(
          message: e.toString(),
          position: SnackPosition.TOP,
        );
      }
      pc.loading.value = false;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/bg1.jpg',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Obx(
              () {
                final initialLoading = pc.loading.value;

                if (initialLoading == false) {
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 48, horizontal: 8),
                        child: SearchAnchor(
                          builder: (context, searchController) {
                            return SearchBar(
                              controller: searchController,
                              padding: const MaterialStatePropertyAll(
                                EdgeInsets.symmetric(horizontal: 16),
                              ),
                              onTap: () => searchController.openView(),
                              leading: const Icon(Icons.search),
                              hintText: "Search ...",
                              onSubmitted: (value) {
                                searchWeather(value);
                              },
                            );
                          },
                          suggestionsBuilder: (ctx, searchController) {
                            return [
                              for (final name in pc.prevSearchPlaceNames)
                                ListTile(
                                  title: Text(name),
                                  onTap: () => searchController.closeView(name),
                                )
                            ];
                          },
                        ),
                      ),
                      const Spacer(),
                      const PrevPlaces(),
                    ],
                  );
                } else {
                  return Center(
                    child: Lottie.asset('assets/lottie/loading.json'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
