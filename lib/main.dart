import 'package:flutter/material.dart';
import 'widgets/weather_card.dart';
import 'widgets/weekly_forecast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
      ),
      home: const MyHomePage(title: 'Weather Dashboard'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text(title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Weather Info Cards Grid
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: const [
                WeatherCard(icon: Icons.air, value: '13 KM/h', label: 'Wind'),
                WeatherCard(icon: Icons.opacity, value: '24%', label: 'Humidity'),
                WeatherCard(icon: Icons.grain, value: '2%', label: 'Rain'),
                WeatherCard(icon: Icons.wb_sunny, value: '2', label: 'UV Index'),
                WeatherCard(icon: Icons.compress, value: '1012 hPa', label: 'Pressure'),
                WeatherCard(icon: Icons.thermostat, value: '22°C', label: 'Feels like'),
              ],
            ),
            const SizedBox(height: 24),

            // 🔹 Weekly Forecast Section
            const WeeklyForecast(),
          ],
        ),
      ),
    );
  }
}
