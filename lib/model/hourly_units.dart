class HourlyUnits {
  final String? temperature2m;
  final String? weatherCode;

  HourlyUnits({this.temperature2m, this.weatherCode});

  factory HourlyUnits.fromJson(Map<String, dynamic> json) {
    return HourlyUnits(
      temperature2m: json['temperature_2m'],
      weatherCode: json['weathercode'],
    );
  }
}
