class WeatherModel {
  final String description;
  final String main;

  const WeatherModel({
    required this.description,
    required this.main,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      description: json['description']!,
      main: json['main']!,
    );
  }
}
