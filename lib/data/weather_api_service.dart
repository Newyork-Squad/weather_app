import 'package:dio/dio.dart';
import 'package:weather_app/data/dto/weather_response_dto.dart';

class WeatherApiService {
  final Dio _dio;

  WeatherApiService({Dio? dio}) : _dio = dio ?? Dio() {
    _dio.options.baseUrl = 'https://api.open-meteo.com/v1';
    _dio.options.connectTimeout = const Duration(seconds: 60);
    _dio.options.receiveTimeout = const Duration(seconds: 60);
    _dio.interceptors.add(
      LogInterceptor(
        request: false,
        requestBody: false,
        responseBody: true,
        responseHeader: false,
        error: true,
      ),
    );
  }

  Future<WeatherResponseDto> getWeather({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final response = await _dio.get(
        '/forecast',
        queryParameters: {
          'latitude': latitude,
          'longitude': longitude,
          'current':
              'weather_code,relative_humidity_2m,wind_speed_10m,'
              'precipitation_probability,surface_pressure,'
              'apparent_temperature,temperature_2m,is_day',
          'daily':
              'temperature_2m_max,temperature_2m_min,weathercode,uv_index_max',
          'timezone': 'auto',
          'hourly': 'temperature_2m,weathercode',
          'forecast_days': 1,
          'past_hours': 1,
        },
      );

      return WeatherResponseDto.fromJson(response.data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('Connection timed out');
      } else if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Data reception timeout has expired');
      } else if (e.response?.statusCode == 404) {
        throw Exception('Data not found');
      } else {
        throw Exception('Failed to fetch weather data: ${e.message}');
      }
    } catch (e) {
      print('💥 Error in getWeather: $e');
      throw Exception('Unexpected error: $e');
    }
  }
}
