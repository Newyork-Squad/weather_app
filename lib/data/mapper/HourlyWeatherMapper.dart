import '../dto/hourly_weather_dto.dart';
import '../model/HourlyWeather.dart';

extension HourlyWeatherMapper on HourlyWeatherDto {
  List<HourlyWeather> toDomain() {
    final List<HourlyWeather> result = [];

    if (time == null || temperature2m == null || weathercode == null) {
      return result;
    }

    for (int i = 0; i < time!.length; i++) {
      result.add(
        HourlyWeather(
          time: time![i],
          temperature: temperature2m![i],
          weatherCode: weathercode![i],
        ),
      );
    }

    return result;
  }
}
