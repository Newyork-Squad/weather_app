import 'package:weather_app/data/location_service.dart';
import 'package:weather_app/data/mapper/weather_response_mapper.dart';
import 'package:weather_app/data/respository.dart';
import 'package:weather_app/data/weather_api_service.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final LocationService _locationService;
  final WeatherApiService _weatherApiService;

  WeatherRepositoryImpl(this._locationService, this._weatherApiService);

  @override
  Future<String> getCityName() async {
    try {
      final LocationData locationData = await _locationService
          .getCurrentLocation();
      final dto = await _weatherApiService.getWeather(
        latitude: locationData.latitude,
        longitude: locationData.longitude,
      );

      final weatherDomainModel = dto.toDomain();

      return weatherDomainModel.timezone ?? "Unknown";
    } catch (e) {
      return "Error when getting location";
    }
  }
}
