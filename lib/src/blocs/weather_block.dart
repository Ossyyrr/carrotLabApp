import 'package:carrotslabapp/src/models/climate_model.dart';
import 'package:carrotslabapp/src/repositories/weather_repository.dart';
import 'package:rxdart/rxdart.dart';

class WeatherBloc {
  final WeatherRepository weatherRepository = WeatherRepository();

  final PublishSubject<ClimateModel> weatherFetcher =
      PublishSubject<ClimateModel>();

  Stream<ClimateModel> get weather => weatherFetcher.stream;

  Future<void> fetchWeather(String lat, String lon) async {
    final weather = await weatherRepository.fetchWeather(lat, lon);

    weatherFetcher.sink.add(weather);
  }

  void dispose() {
    weatherFetcher.close();
  }
}
