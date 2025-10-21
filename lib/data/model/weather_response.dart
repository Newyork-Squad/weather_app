import 'package:weather_app/data/model/HourlyWeather.dart';
import 'package:weather_app/data/model/hourly_units.dart';

import 'current_units.dart';
import 'current_weather.dart';
import 'daily_units.dart';
import 'daily_weather.dart';

class WeatherResponse {
  final double? latitude;
  final double? longitude;
  final double? generationtimeMs;
  final int? utcOffsetSeconds;
  final String? timezone;
  final String? timezoneAbbreviation;
  final int? elevation;

  final CurrentUnit? currentUnits;
  final CurrentWeather? current;
  final DailyUnit? dailyUnits;
  final List<DailyWeather> daily;
  final HourlyUnits? hourlyUnits;
  final List<HourlyWeather> hourly;

  WeatherResponse({
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
    required this.daily,
    this.hourlyUnits,
    required this.hourly,
  });
}
