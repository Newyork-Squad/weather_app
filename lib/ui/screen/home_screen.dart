import 'package:flutter/material.dart';
import 'package:weather_app/ui/designSystem/theme/weather_theme.dart';
import 'package:weather_app/data/weather_api_service.dart';
import 'package:weather_app/data/mapper/weather_response_mapper.dart';

import '../widget/WeatherInfoGrid.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoading = true;
  String _windSpeed = '--';
  String _humidity = '--';
  String _rainChance = '--';
  String _uvIndex = '--';
  String _pressure = '--';
  String _feelsLike = '--';

  @override
  void initState() {
    super.initState();
    _loadWeather();
  }

  void _loadWeather() async {
    final weatherApi = WeatherApiService();

    try {
      final dto = await weatherApi.getWeather(
        latitude: 30.0444,
        longitude: 31.2357,
      );

      final weatherData = dto.toDomain();

      setState(() {
        _windSpeed = '${weatherData.current?.windSpeed10m ?? '--'} ${weatherData.currentUnits?.windSpeed10m ?? ''}';
        _humidity = '${weatherData.current?.relativeHumidity2m ?? '--'}${weatherData.currentUnits?.relativeHumidity2m ?? ''}';
        _feelsLike = '${weatherData.current?.apparentTemperature ?? '--'}${weatherData.currentUnits?.apparentTemperature ?? ''}';

        if (weatherData.daily.isNotEmpty) {
          final today = weatherData.daily.first;
          _uvIndex = '${today.uvIndex ?? '--'}';
          _rainChance = '2%';
        }

        _pressure = '1012 hPa';
        _isLoading = false;
      });
    } catch (e) {
      print('Error loading weather: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = MyWeatherTheme.of(context);

    if (_isLoading) {
      return Center(
        child: CircularProgressIndicator(
          color: theme.colors.brand,
        ),
      );
    }

    return Column(
      children: <Widget>[
        Container(
          height: 100,
          width: 100,
          color: theme.colors.surfacePrimary,
          alignment: Alignment.center,
          child: Text(
            'Weather',
            style: theme.typography.textTheme.titleMedium,
          ),
        ),
        const SizedBox(height: 20),
        WeatherInfoGrid(
          windSpeed: _windSpeed,
          humidity: _humidity,
          rainChance: _rainChance,
          uvIndex: _uvIndex,
          pressure: _pressure,
          feelsLike: _feelsLike,
        ),
      ],
    );
  }
}