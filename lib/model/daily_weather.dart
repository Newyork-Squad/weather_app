class DailyWeather {
  final List<double>? temperature2mMax;
  final List<double>? temperature2mMin;
  final List<int>? weathercode;
  final List<double>? uvIndexMax;

  DailyWeather({
    this.temperature2mMax,
    this.temperature2mMin,
    this.weathercode,
    this.uvIndexMax,
  });

  factory DailyWeather.fromJson(Map<String, dynamic> json) {
    return DailyWeather(
      temperature2mMax: (json['temperature_2m_max'] as List<dynamic>?)
          ?.map<double>((e) => (e as num).toDouble())
          .toList(),
      temperature2mMin: (json['temperature_2m_min'] as List<dynamic>?)
          ?.map<double>((e) => (e as num).toDouble())
          .toList(),
      weathercode: (json['weathercode'] as List<dynamic>?)
          ?.map<int>((e) => e as int)
          .toList(),
      uvIndexMax: (json['uv_index_max'] as List<dynamic>?)
          ?.map<double>((e) => (e as num).toDouble())
          .toList(),
    );
  }
}