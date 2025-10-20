import 'package:flutter/material.dart';

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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
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
      ),
    );
  }
}

