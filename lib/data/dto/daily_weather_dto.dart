class DailyWeatherDto {
  final List<String>? time;
  final List<double>? temperature2mMax;
  final List<double>? temperature2mMin;
  final List<int>? weathercode;
  final List<double>? uvIndexMax;

  DailyWeatherDto({
    this.time,
    this.temperature2mMax,
    this.temperature2mMin,
    this.weathercode,
    this.uvIndexMax,
  });

  factory DailyWeatherDto.fromJson(Map<String, dynamic> json) {
    return DailyWeatherDto(
      time: json['time'] != null
          ? (json['time'] as List).map((e) => e.toString()).toList()
          : null,
      temperature2mMax: json['temperature_2m_max'] != null
          ? (json['temperature_2m_max'] as List).map((e) => (e as num).toDouble()).toList()
          : null,
      temperature2mMin: json['temperature_2m_min'] != null
          ? (json['temperature_2m_min'] as List).map((e) => (e as num).toDouble()).toList()
          : null,
      weathercode: json['weathercode'] != null
          ? (json['weathercode'] as List).map((e) => (e as num).toInt()).toList()
          : null,
      uvIndexMax: json['uv_index_max'] != null
          ? (json['uv_index_max'] as List).map((e) => (e as num).toDouble()).toList()
          : null,
    );
  }

}