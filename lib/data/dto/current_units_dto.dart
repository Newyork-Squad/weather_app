import 'package:weather_app/data/model/current_units.dart';

class CurrentUnitsDto {
  final String? time;
  final String? interval;
  final String? temperature2m;
  final String? relativeHumidity2m;
  final String? apparentTemperature;
  final String? isDay;
  final String? precipitationProbability;
  final String? weatherCode;
  final String? surfacePressure;
  final String? windSpeed10m;

  CurrentUnitsDto({
    this.time,
    this.interval,
    this.temperature2m,
    this.relativeHumidity2m,
    this.apparentTemperature,
    this.isDay,
    this.precipitationProbability,
    this.weatherCode,
    this.surfacePressure,
    this.windSpeed10m,
  });

  factory CurrentUnitsDto.fromJson(Map<String, dynamic> json) {
    return CurrentUnitsDto(
      time: json['time'] as String?,
      interval: json['interval'] as String?,
      temperature2m: json['temperature_2m'] as String?,
      relativeHumidity2m: json['relative_humidity_2m'] as String?,
      apparentTemperature: json['apparent_temperature'] as String?,
      isDay: json['is_day'] as String?,
      precipitationProbability: json['precipitation_probability'] as String?,
      weatherCode: json['weather_code'] as String?,
      surfacePressure: json['surface_pressure'] as String?,
      windSpeed10m: json['wind_speed_10m'] as String?,
    );
  }

}
