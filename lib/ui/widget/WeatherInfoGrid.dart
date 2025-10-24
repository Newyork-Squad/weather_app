import 'package:flutter/material.dart';
import 'weather_card.dart';

class WeatherInfoGrid extends StatelessWidget {
  final String windSpeed;
  final String humidity;
  final String rainChance;
  final String uvIndex;
  final String pressure;
  final String feelsLike;

  const WeatherInfoGrid({
    super.key,
    required this.windSpeed,
    required this.humidity,
    required this.rainChance,
    required this.uvIndex,
    required this.pressure,
    required this.feelsLike,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        WeatherCard(
          icon: 'assets/icons/ic_fast_wind.svg',
          value: '13',
          unit: 'KM/h',
          label: 'Wind',
        ),
        WeatherCard(
          icon: 'assets/icons/ic_humidity.svg',
          value: '24',
          unit: '%',
          label: 'Humidity',
        ),
        WeatherCard(
          icon: 'assets/icons/ic_rain.svg',
          value: '2',
          unit: '%',
          label: 'Rain',
        ),
        WeatherCard(
          icon: 'assets/icons/ic_uv.svg',
          value: '2',
          label: 'UV Index',
        ),
        WeatherCard(
          icon: 'assets/icons/ic_arrow_down_05.svg',
          value: '1012',
          unit: 'hPa',
          label: 'Pressure',
        ),
        WeatherCard(
          icon: 'assets/icons/ic_temperature.svg',
          value: '22',
          unit: '°C',
          label: 'Feels like',
        ),
      ],
    );
  }
}
