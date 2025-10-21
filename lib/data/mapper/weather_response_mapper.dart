import 'package:weather_app/data/mapper/HourlyWeatherMapper.dart';
import 'package:weather_app/data/mapper/current_unit_mapper.dart';
import 'package:weather_app/data/mapper/current_weather_mapper.dart';
import 'package:weather_app/data/mapper/daily_unit_mapper.dart';
import 'package:weather_app/data/mapper/daily_weather_mapper.dart';
import 'package:weather_app/data/mapper/hourly_unit_mapper.dart';

import '../dto/weather_response_dto.dart';
import '../model/HourlyWeather.dart';
import '../model/daily_weather.dart';
import '../model/weather_response.dart';

extension WeatherResponseMapper on WeatherResponseDto {
  WeatherResponse toDomain() {
    return WeatherResponse(
      latitude: latitude,
      longitude: longitude,
      generationtimeMs: generationtimeMs,
      utcOffsetSeconds: utcOffsetSeconds,
      timezone: timezone,
      timezoneAbbreviation: timezoneAbbreviation,
      elevation: elevation,
      currentUnits: currentUnits?.toDomain(),
      current: current?.toDomain(),
      dailyUnits: dailyUnits?.toDomain(),
      daily: daily?.toDomain() ?? <DailyWeather>[],
      hourlyUnits: hourlyUnits?.toDomain(),
      hourly: hourly?.toDomain() ?? <HourlyWeather>[],
    );
  }
}