class DailyUnits {
  final String? temperature2mMax;
  final String? temperature2mMin;
  final String? weatherCode;
  final String? uVIndexMax;

  DailyUnits({this.temperature2mMax,this.temperature2mMin, this.weatherCode, this.uVIndexMax});

  factory DailyUnits.fromJson(Map<String, dynamic> json) {
    return DailyUnits(
      temperature2mMax: json['temperature_2m_max'],
      temperature2mMin: json['temperature_2m_min'],
      weatherCode: json['weathercode'],
      uVIndexMax: json['uv_index_max'],
    );
  }
}
