import 'package:carrotslabapp/src/models/main_model.dart';
import 'package:carrotslabapp/src/models/weather_model.dart';

class ClimateModel {
  final List<WeatherModel> weather;
  final MainModel main;

  const ClimateModel({
    required this.weather,
    required this.main,
  });

  factory ClimateModel.fromJson(Map<String, dynamic> json) {
    final weather = json['weather'] != null && json['weather'].length != 0
        ? json['weather']
            .map<WeatherModel>((examType) => WeatherModel.fromJson(examType))
            .toList()
        : [];

    return ClimateModel(
      weather: weather,
      main: MainModel.fromJson(json['main']),
    );
  }
}
