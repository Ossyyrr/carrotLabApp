class MainModel {
  final double temp;

  const MainModel({
    required this.temp,
  });

  factory MainModel.fromJson(Map<String, dynamic> json) {
    return MainModel(
      temp: json['temp']!,
    );
  }
}
