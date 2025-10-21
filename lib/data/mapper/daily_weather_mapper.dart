import '../dto/daily_weather_dto.dart';
import '../model/daily_weather.dart';

extension DailyWeatherMapper on DailyWeatherDto {
  List<DailyWeather> toDomain() {
    final List<DailyWeather> result = [];

    if (time == null ||
        temperature2mMax == null ||
        temperature2mMin == null ||
        weathercode == null ||
        uvIndexMax == null) {
      return result;
    }

    for (int i = 0; i < time!.length; i++) {
      result.add(
        DailyWeather(
          date: time![i],
          maxTemp: temperature2mMax![i],
          minTemp: temperature2mMin![i],
          weatherCode: weathercode![i],
          uvIndex: uvIndexMax![i],
        ),
      );
    }

    return result;
  }
}
