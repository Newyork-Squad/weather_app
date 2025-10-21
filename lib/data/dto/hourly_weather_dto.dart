class HourlyWeatherDto {
  final List<String>? time;
  final List<double>? temperature2m;
  final List<int>? weathercode;

  HourlyWeatherDto({
    this.time,
    this.temperature2m,
    this.weathercode,
  });

  factory HourlyWeatherDto.fromJson(Map<String, dynamic> json) {
    return HourlyWeatherDto(
      time: json['time'] != null
          ? (json['time'] as List).map((e) => e.toString()).toList()
          : null,
      temperature2m: json['temperature_2m'] != null
          ? (json['temperature_2m'] as List).map((e) => (e as num).toDouble()).toList()
          : null,
      weathercode: json['weathercode'] != null
          ? (json['weathercode'] as List).map((e) => (e as num).toInt()).toList()
          : null,
    );
  }

}