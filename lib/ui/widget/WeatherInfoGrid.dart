import 'package:flutter/material.dart';
import '../../utils/weather_utils.dart';
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
      crossAxisSpacing: 6,
      mainAxisSpacing: 6,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        WeatherCard(
          icon: 'assets/icons/ic_fast_wind.svg',
          value: removeDecimal(windSpeed),
          unit: 'KM/h',
          label: 'Wind',
        ),
        WeatherCard(
          icon: 'assets/icons/ic_humidity.svg',
          value: removeDecimal(humidity),
          unit: '%',
          label: 'Humidity',
        ),
        WeatherCard(
          icon: 'assets/icons/ic_rain.svg',
          value: removeDecimal(rainChance),
          unit: '%',
          label: 'Rain',
        ),
        WeatherCard(
          icon: 'assets/icons/ic_uv.svg',
          value: removeDecimal(uvIndex),
          label: 'UV Index',
        ),
        WeatherCard(
          icon: 'assets/icons/ic_arrow_down_05.svg',
          value: removeDecimal(pressure),
          unit: 'hPa',
          label: 'Pressure',
        ),
        WeatherCard(
          icon: 'assets/icons/ic_temperature.svg',
          value: removeDecimal(feelsLike),
          unit: '°C',
          label: 'Feels like',
        ),
      ],
    );
  }
}
