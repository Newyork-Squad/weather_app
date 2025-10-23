import 'package:flutter/material.dart';
import 'package:weather_app/data/mapper/weather_response_mapper.dart';
import 'package:weather_app/data/weather_api_service.dart';
import 'package:weather_app/ui/designSystem/theme/AppThemeProvider.dart';
import 'package:weather_app/ui/designSystem/theme/weather_theme.dart';
import 'package:weather_app/ui/screen/home_screen.dart';
import 'package:weather_app/ui/widget/weakly_weather_widget.dart';

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
      child: Container( // Same background for the entire app
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              theme.colors.backgroundPrimary,
              theme.colors.backgroundSecondary,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(child: WeeklyForecastScreen()), // SafeArea to avoid overlaps with system UI
      ),
    );
  }
}
