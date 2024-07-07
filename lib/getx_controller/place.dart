import 'package:get/get.dart';
import 'package:internshala_go_india/model/place.dart';
import 'package:internshala_go_india/utils/storage.dart';

class PlaceController extends GetxController {
  RxList<String> prevSearchPlaceNames = <String>[].obs;
  RxMap<String, PlaceModel> prevSearchPlaces = <String, PlaceModel>{}.obs;
  RxBool loading = true.obs;

  @override
  void onInit() async {
    final places = await getSavedPlaces();
    if (places != null) {
      prevSearchPlaces.value = places;
      prevSearchPlaceNames.value = [...prevSearchPlaces.keys];
    }
    loading.value = false;
    super.onInit();
  }

  void updatePlaceList(PlaceModel weatherDetails) async {
    final keys = prevSearchPlaces.keys.toList();
    final placeName = weatherDetails.placeName;

    if (keys.contains(placeName)) {
      prevSearchPlaces.remove(placeName);
      prevSearchPlaces[placeName] = weatherDetails;
    } else {
      if (prevSearchPlaces.length < 5) {
        prevSearchPlaces[placeName] = weatherDetails;
      } else {
        prevSearchPlaces.remove(keys.last);
        prevSearchPlaces[placeName] = weatherDetails;
      }
    }

    prevSearchPlaceNames.value = [...prevSearchPlaces.keys.toList().reversed];

    savePlace(prevSearchPlaces);
  }
}
