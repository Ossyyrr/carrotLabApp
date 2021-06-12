import 'package:carrotslabapp/src/models/climate_model.dart';
import 'package:carrotslabapp/src/repositories/weather_repository.dart';
import 'package:rxdart/rxdart.dart';

class WeatherBloc {
  final WeatherRepository weatherRepository = WeatherRepository();

  final PublishSubject<ClimateModel> weatherFetcher =
      PublishSubject<ClimateModel>();

  Stream<ClimateModel> get weather => weatherFetcher.stream;

  Future<ClimateModel> fetchWeather() async {
    final weather = await weatherRepository.fetchWeather();
    weatherFetcher.sink.add(weather);
    return weather;
  }

  void dispose() {
    weatherFetcher.close();
  }
}
