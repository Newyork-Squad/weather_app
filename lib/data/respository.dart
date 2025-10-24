import 'model/weather_response.dart';

abstract class WeatherRepository {
  Future<WeatherResponse> getWeatherForCurrentLocation();
}
