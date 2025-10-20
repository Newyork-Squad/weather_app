class HourlyWeather {
  final List<double>? temperature2m;
  final List<int>? weathercode;

  HourlyWeather({
    this.temperature2m,
    this.weathercode,
  });

  factory HourlyWeather.fromJson(Map<String, dynamic> json) {
    return HourlyWeather(
      temperature2m: (json['temperature_2m'] as List<dynamic>?)
          ?.map<double>((e) => (e as num).toDouble())
          .toList(),
      weathercode: (json['weathercode'] as List<dynamic>?)
          ?.map<int>((e) => e as int)
          .toList(),
    );
  }
}