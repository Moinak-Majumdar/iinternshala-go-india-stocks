import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:internshala_go_india/model/place.dart';

Future<PlaceModel> fetchWeatherApi(String place) async {
  final dio = Dio();

  try {
    final res = await dio.get(
      'https://api.openweathermap.org/data/2.5/weather',
      queryParameters: {
        'q': place,
        'appid': dotenv.env['API_KEY'],
        'units': 'metric',
      },
    );

    final serverData = PlaceServerModel.fromJson(res.data);

    return serverData.place;
  } catch (e) {
    if (e is DioException) {
      if (e.type == DioExceptionType.badResponse && e.response != null) {
        if (e.response!.statusCode == 404) {
          throw Exception('City not found!');
        }

        throw Exception(
            'Failed with status code: ${e.response!.statusCode} \n${e.response!.data['message']}');
      } else {
        throw Exception(e);
      }
    } else {
      throw Exception(e);
    }
  }
}
