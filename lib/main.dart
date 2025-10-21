import 'package:flutter/material.dart';
import 'package:weather_app/data/mapper/weather_response_mapper.dart';
import 'package:weather_app/data/weather_api_service.dart';
import 'package:weather_app/ui/designSystem/theme/AppThemeProvider.dart';
import 'package:weather_app/ui/designSystem/theme/weather_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(AppThemeProvider(brightness: Brightness.light, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void _loadWeather() async {
    final weatherApi = WeatherApiService();

    try {
      final dto = await weatherApi.getWeather(
        latitude: 30.0444,
        longitude: 31.2357,
      );

      final weatherDomainModel = dto.toDomain();
      print('============== Weather Data (DOMAIN) ==============');
      print('Temperature: ${weatherDomainModel.current?.temperature2m}${weatherDomainModel.currentUnits?.temperature2m}');
      print('Feels like: ${weatherDomainModel.current?.apparentTemperature}${weatherDomainModel.currentUnits?.apparentTemperature}');
      print('Humidity: ${weatherDomainModel.current?.relativeHumidity2m}${weatherDomainModel.currentUnits?.relativeHumidity2m}');
      print('Wind Speed: ${weatherDomainModel.current?.windSpeed10m} ${weatherDomainModel.currentUnits?.windSpeed10m}');
      print('Weather Code: ${weatherDomainModel.current?.weatherCode}');
      print('Is Day: ${weatherDomainModel.current?.isDay}');
      print('==========================================');

      if (weatherDomainModel.daily.isNotEmpty) {
        final today = weatherDomainModel.daily.first;
        print('--- Daily Forecast ---');
        print('Date: ${today.date}');
        print('Max Temp: ${today.maxTemp}');
        print('Min Temp: ${today.minTemp}');
        print('UV Index: ${today.uvIndex}');
        print('Weather Code: ${today.weatherCode}');
      }

      if (weatherDomainModel.hourly.isNotEmpty) {
        final now = weatherDomainModel.hourly.first;
        print('--- Hourly Forecast ---');
        print('Time: ${now.time}');
        print('Temp: ${now.temperature}');
        print('Weather Code: ${now.weatherCode}');
      }

    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    _loadWeather();
    final theme = MyWeatherTheme.of(context);

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: theme.colors.backgroundPrimary,
            child: Center(
              child: Container(
                color: theme.colors.surfaceSecondary,
                padding: const EdgeInsets.all(16),
                child: Text(
                  "This is the new design system",
                  style: theme.typography.textTheme.headlineLarge?.copyWith(
                    color: theme.colors.shadePrimary,
                  ),
                ),
              ),
            ),
          ),
          Image.asset(
            'assets/images/clear_sky_day.png',
            width: 100,
            height: 100,
          ),
          SvgPicture.asset(
            'assets/icons/ic_fast_wind.svg',
            width: 48,
            height: 48,
            color: theme.colors.brand,
          ),
        ],
      ),
    );
  }
}
