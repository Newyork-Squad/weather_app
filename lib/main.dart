import 'package:flutter/material.dart';
import 'package:weather_app/services/weather_api_service.dart';
import 'package:weather_app/ui/designSystem/theme/AppThemeProvider.dart';
import 'package:weather_app/ui/designSystem/theme/weather_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(
    AppThemeProvider(
      brightness: Brightness.light,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  void _loadWeather() async {
    final weatherApi = WeatherApiService();

    try {
      final data = await weatherApi.getWeather(
        latitude: 30.0444,
        longitude: 31.2357,
      );

      print('============== Weather Data ==============');
      print('Temperature: ${data.current?.temperature2m}${data.currentUnits?.temperature2m}');
      print('Feels like: ${data.current?.apparentTemperature}${data.currentUnits?.apparentTemperature}');
      print('Humidity: ${data.current?.relativeHumidity2m}${data.currentUnits?.relativeHumidity2m}');
      print('Wind Speed: ${data.current?.windSpeed10m} ${data.currentUnits?.windSpeed10m}');
      print('Weather Code: ${data.current?.weatherCode}');
      print('Is Day: ${data.current?.isDay}');
      print('==========================================');
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
                      color: theme.colors.shadePrimary
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
          )
        ],
      )
    );
  }
}
