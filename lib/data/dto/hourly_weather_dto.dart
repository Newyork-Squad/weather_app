class HourlyWeatherDto {
  final List<String>? time;
  final List<double>? temperature2m;
  final List<int>? weathercode;
  final List<int>? isDay;

  HourlyWeatherDto({
    this.time,
    this.temperature2m,
    this.weathercode,
    this.isDay,
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
      isDay: json['is_day'] != null
          ? (json['is_day'] as List).map((e) => (e as num).toInt()).toList()
          : null,
    );
  }

}