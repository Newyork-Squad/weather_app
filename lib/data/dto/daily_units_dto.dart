import 'package:weather_app/data/model/daily_units.dart';

class DailyUnitsDto {
  final String? time;
  final String? temperature2mMax;
  final String? temperature2mMin;
  final String? weathercode;
  final String? uvIndexMax;

  DailyUnitsDto({
    this.time,
    this.temperature2mMax,
    this.temperature2mMin,
    this.weathercode,
    this.uvIndexMax,
  });

  factory DailyUnitsDto.fromJson(Map<String, dynamic> json) {
    return DailyUnitsDto(
      time: json['time'] as String?,
      temperature2mMax: json['temperature_2m_max'] as String?,
      temperature2mMin: json['temperature_2m_min'] as String?,
      weathercode: json['weathercode'] as String?,
      uvIndexMax: json['uv_index_max'] as String?,
    );
  }

  DailyUnit toDomainEntity() {
    return DailyUnit(
      time: time,
      temperature2mMax: temperature2mMax,
      temperature2mMin: temperature2mMin,
      weathercode: weathercode,
      uvIndexMax: uvIndexMax,
    );
  }
}
