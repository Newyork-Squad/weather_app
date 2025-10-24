

import 'package:weather_app/data/mapper/weather_response_mapper.dart';
import 'package:weather_app/data/respository.dart';
import 'package:weather_app/data/weather_api_service.dart';

import 'location_service.dart';
import 'model/weather_response.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherApiService weatherApiService;
  final LocationService locationService;

  WeatherRepositoryImpl({
    required this.weatherApiService,
    required this.locationService,
  });

  @override
  Future<WeatherResponse> getWeatherForCurrentLocation() async {
    try {
      final location = await locationService.getCurrentLocation();
      final weatherDto = await weatherApiService.getWeather(
        latitude: location.latitude,
        longitude: location.longitude,
      );
      final WeatherResponse weather = weatherDto.toDomain();
      return weather;
    } catch (e) {
      throw e;
    }
  }
}
