import 'package:weather_app/data/dto/current_weather_dto.dart';
import 'package:weather_app/data/model/current_weather.dart';

extension CurrentWeatherMapper on CurrentWeatherDto{
  CurrentWeather toDomain(){
    return CurrentWeather(
      time:time,
      interval:interval,
      temperature2m:temperature2m,
      relativeHumidity2m:relativeHumidity2m,
      apparentTemperature:apparentTemperature,
      isDay:isDay,
      precipitationProbability:precipitationProbability,
      weatherCode:weatherCode,
      surfacePressure:surfacePressure,
      windSpeed10m:windSpeed10m,
    );
  }
}