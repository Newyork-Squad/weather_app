import 'package:weather_app/data/dto/current_units_dto.dart';
import 'package:weather_app/data/dto/current_weather_dto.dart';
import 'package:weather_app/data/dto/hourly_weather_dto.dart';

import 'daily_units_dto.dart';
import 'daily_weather_dto.dart';
import 'hourly_units_dto.dart';

class WeatherResponseDto {
  final double? latitude;
  final double? longitude;
  final double? generationtimeMs;
  final int? utcOffsetSeconds;
  final String? timezone;
  final String? timezoneAbbreviation;
  final int? elevation;
  final CurrentUnitsDto? currentUnits;
  final CurrentWeatherDto? current;
  final DailyUnitsDto? dailyUnits;
  final DailyWeatherDto? daily;
  final HourlyUnitsDto? hourlyUnits;
  final HourlyWeatherDto? hourly;

  WeatherResponseDto({
    this.latitude,
    this.longitude,
    this.generationtimeMs,
    this.utcOffsetSeconds,
    this.timezone,
    this.timezoneAbbreviation,
    this.elevation,
    this.currentUnits,
    this.current,
    this.dailyUnits,
    this.daily,
    this.hourlyUnits,
    this.hourly,
  });

  factory WeatherResponseDto.fromJson(Map<String, dynamic> json) {
    return WeatherResponseDto(
      latitude: json['latitude'] != null
          ? (json['latitude'] as num).toDouble()
          : null,
      longitude: json['longitude'] != null
          ? (json['longitude'] as num).toDouble()
          : null,
      generationtimeMs: json['generationtime_ms'] != null
          ? (json['generationtime_ms'] as num).toDouble()
          : null,
      utcOffsetSeconds: json['utc_offset_seconds'] != null
          ? (json['utc_offset_seconds'] as num).toInt()
          : null,
      timezone: json['timezone'] as String?,
      timezoneAbbreviation: json['timezone_abbreviation'] as String?,
      elevation: json['elevation'] != null
          ? (json['elevation'] as num).toInt()
          : null,
      currentUnits: json['current_units'] != null
          ? CurrentUnitsDto.fromJson(json['current_units'] as Map<String, dynamic>)
          : null,
      current: json['current'] != null
          ? CurrentWeatherDto.fromJson(json['current'] as Map<String, dynamic>)
          : null,
      dailyUnits: json['daily_units'] != null
          ? DailyUnitsDto.fromJson(json['daily_units'] as Map<String, dynamic>)
          : null,
      daily: json['daily'] != null
          ? DailyWeatherDto.fromJson(json['daily'] as Map<String, dynamic>)
          : null,
      hourlyUnits: json['hourly_units'] != null
          ? HourlyUnitsDto.fromJson(json['hourly_units'] as Map<String, dynamic>)
          : null,
      hourly: json['hourly'] != null
          ? HourlyWeatherDto.fromJson(json['hourly'] as Map<String, dynamic>)
          : null,
    );
  }
}