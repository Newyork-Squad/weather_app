import 'package:weather_app/data/model/current_weather.dart';

class CurrentWeatherDto {
  final String? time;
  final int? interval;
  final double? temperature2m;
  final int? relativeHumidity2m;
  final double? apparentTemperature;
  final int? isDay;
  final int? precipitationProbability;
  final int? weatherCode;
  final double? surfacePressure;
  final double? windSpeed10m;

  CurrentWeatherDto({
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

  factory CurrentWeatherDto.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherDto(
      time: json['time'] as String?,
      interval: json['interval'] != null
          ? (json['interval'] as num).toInt()
          : null,
      temperature2m: json['temperature_2m'] != null
          ? (json['temperature_2m'] as num).toDouble()
          : null,
      relativeHumidity2m: json['relative_humidity_2m'] != null
          ? (json['relative_humidity_2m'] as num).toInt()
          : null,
      apparentTemperature: json['apparent_temperature'] != null
          ? (json['apparent_temperature'] as num).toDouble()
          : null,
      isDay: json['is_day'] != null ? (json['is_day'] as num).toInt() : null,
      precipitationProbability: json['precipitation_probability'] != null
          ? (json['precipitation_probability'] as num).toInt()
          : null,
      weatherCode: json['weather_code'] != null
          ? (json['weather_code'] as num).toInt()
          : null,
      surfacePressure: json['surface_pressure'] != null
          ? (json['surface_pressure'] as num).toDouble()
          : null,
      windSpeed10m: json['wind_speed_10m'] != null
          ? (json['wind_speed_10m'] as num).toDouble()
          : null,
    );
  }

  CurrentWeather toDomainEntity() {
    return CurrentWeather(
      time: time,
      interval: interval,
      temperature2m: temperature2m,
      relativeHumidity2m: relativeHumidity2m,
      apparentTemperature: apparentTemperature,
      isDay: isDay,
      precipitationProbability: precipitationProbability,
      weatherCode: weatherCode,
      surfacePressure: surfacePressure,
      windSpeed10m: windSpeed10m,
    );
  }
}
