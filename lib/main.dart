import 'package:flutter/material.dart';
import 'package:weather_app/ui/designSystem/theme/AppThemeProvider.dart';
import 'package:weather_app/ui/designSystem/theme/weather_theme.dart';

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

  @override
  Widget build(BuildContext context) {
    final theme = MyWeatherTheme.of(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFF0A0E21),
        appBar: AppBar(
          title: const Text("Weather App"),
          backgroundColor: theme.colors.brand,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            children: const [
              WeatherCard(icon: Icons.air, value: '13 KM/h', label: 'Wind'),
              WeatherCard(icon: Icons.opacity, value: '24%', label: 'Humidity'),
              WeatherCard(icon: Icons.grain, value: '2%', label: 'Rain'),
              WeatherCard(icon: Icons.wb_sunny, value: '2', label: 'UV Index'),
              WeatherCard(icon: Icons.compress, value: '1012 hPa', label: 'Pressure'),
              WeatherCard(icon: Icons.thermostat, value: '22°C', label: 'Feels like'),
            ],
          ),
        ),
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  final IconData icon;
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
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF111328),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 36, color: Colors.lightBlueAccent),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.lightBlueAccent,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
