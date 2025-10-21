import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/ui/designSystem/theme/AppThemeProvider.dart';
import 'package:weather_app/ui/designSystem/theme/weather_theme.dart';

void main() {
  runApp(
    const AppThemeProvider(
      brightness: Brightness.dark,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      home: WeatherHomePage(),
    );
  }
}

class WeatherHomePage extends StatelessWidget {
  const WeatherHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = MyWeatherTheme.of(context);

    return Scaffold(
      backgroundColor: theme.colors.backgroundPrimary,
      appBar: AppBar(
        title: Text(
          "Weather App",
          style: theme.typography.textTheme.titleLarge?.copyWith(
            color: theme.colors.shadePrimary,
          ),
        ),
        backgroundColor: theme.colors.backgroundSecondary,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            WeatherCard(
              icon: 'assets/icons/ic_fast_wind.svg',
              value: '13 KM/h',
              label: 'Wind',
            ),
            WeatherCard(
              icon: 'assets/icons/ic_humidity.svg',
              value: '24%',
              label: 'Humidity',
            ),
            WeatherCard(
              icon: 'assets/icons/ic_rain.svg',
              value: '2%',
              label: 'Rain',
            ),
            WeatherCard(
              icon: 'assets/icons/ic_uv.svg',
              value: '2',
              label: 'UV Index',
            ),
            WeatherCard(
              icon: 'assets/icons/ic_arrow_down.svg',
              value: '1012 hPa',
              label: 'Pressure',
            ),
            WeatherCard(
              icon: 'assets/icons/ic_temperature.svg',
              value: '22°C',
              label: 'Feels like',
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  final String icon;
  final String value;
  final String label;

  const WeatherCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final theme = MyWeatherTheme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colors.surfacePrimary,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: theme.colors.strokePrimary,
          width: 1,
        ),
      ),
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: SvgPicture.asset(
              icon,
              width: 32,
              height: 32,
              colorFilter: ColorFilter.mode(
                theme.colors.brand,
                BlendMode.srcIn,
              ),
              // Add error handling
              placeholderBuilder: (context) => Icon(
                Icons.image_not_supported,
                size: 32,
                color: theme.colors.brand,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: theme.typography.textTheme.labelLarge?.copyWith(
                color: theme.colors.shadePrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Flexible(
            child: Text(
              label,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: theme.typography.textTheme.labelSmall?.copyWith(
                color: theme.colors.shadeSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}