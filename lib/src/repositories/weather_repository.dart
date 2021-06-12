import 'dart:convert';

import 'package:carrotslabapp/src/models/climate_model.dart';
import 'package:http/http.dart' as http;

class WeatherRepository {
  /* Future<SearchModel> fetchSearch(String text) async {
    final url = Uri.parse('$URI_API/search?term=$text&$LOCALE&$API_KEY');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var prueba = jsonDecode(response.body);
      final SearchModel search = SearchModel.fromJson(prueba);

      return search;
    } else {
      throw Exception('Fallo al pedir la canción');
    }
  }*/

  Future<ClimateModel> fetchWeather() async {
    print('------------------------------------ FETCH -----------------');

    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=34&lon=42&appid=8d1f8534a7503e0e6f7b0c3655bc5c0a&units=metric');
    final response = await http.get(url);
    print('response.body ------------------');
    print(response.body);

    if (response.statusCode == 200) {
      print('1');
      var data = jsonDecode(response.body);
      print('2');

      final ClimateModel climate = ClimateModel.fromJson(data);

      print('-------------------- MAIN  ----');
      print(climate.main.temp);
      print('-------------------- climate ----');
      print(climate.weather[0].description);

      return climate;
    } else {
      throw Exception('Fallo al pedir la canción');
    }
  }
}
