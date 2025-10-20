import 'package:weather_app/model/current_units.dart';
import 'package:weather_app/model/current_weather.dart';
import 'package:weather_app/model/daily_units.dart';
import 'package:weather_app/model/daily_weather.dart';
import 'package:weather_app/model/hourly_units.dart';
import 'package:weather_app/model/hourly_weather.dart';

class WeatherResponseDto {
  final CurrentUnits? currentUnits;
  final CurrentWeather? current;
  final DailyUnits? dailyUnits;
  final DailyWeather? daily;
  final HourlyUnits? hourlyUnits;
  final HourlyWeather? hourly;
  final String? timezone;

  WeatherResponseDto({
    this.currentUnits,
    this.current,
    this.dailyUnits,
    this.daily,
    this.hourlyUnits,
    this.hourly,
    this.timezone,
  });

  factory WeatherResponseDto.fromJson(Map<String, dynamic> json) {
    return WeatherResponseDto(
      currentUnits: json['current_units'] != null
          ? CurrentUnits.fromJson(json['current_units'])
          : null,
      current: json['current'] != null
          ? CurrentWeather.fromJson(json['current'])
          : null,
      dailyUnits: json['daily_units'] != null
          ? DailyUnits.fromJson(json['daily_units'])
          : null,
      daily: json['daily'] != null
          ? DailyWeather.fromJson(json['daily'])
          : null,
      hourlyUnits: json['hourly_units'] != null
          ? HourlyUnits.fromJson(json['hourly_units'])
          : null,
      hourly: json['hourly'] != null
          ? HourlyWeather.fromJson(json['hourly'])
          : null,
      timezone: json['timezone'],
    );
  }
}