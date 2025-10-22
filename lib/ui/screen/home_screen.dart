import 'package:flutter/material.dart';

import 'package:weather_app/ui/widget/current_weather.dart';
import '../../ui/designSystem/theme/weather_theme.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = MyWeatherTheme.of(context);
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter( // Placeholder for location
          child: Container(
            alignment: Alignment.center,
            color: Colors.black,
            width: 20,
            height: 30,
          ),
        ),
        CurrentWeather(
          temperature: 22.2,
          weatherIcon: 2,
          weatherMessage: "weatherMessage",
          maxTemp: 2.2,
          minTemp: 1.2,
        ),
        SliverToBoxAdapter(
          child: Container(
            // Placeholder for yor widget
            height: 200,
            width: 100,
            color: theme.colors.glow,
            alignment: Alignment.center,
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            // Placeholder for yor widget
            height: 300,
            width: 100,
            color: theme.colors.shadeSecondary,
            alignment: Alignment.center,
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            // Placeholder for yor widget
            height: 200,
            width: 100,
            color: theme.colors.glow,
            alignment: Alignment.center,
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            // Placeholder for yor widget
            height: 300,
            width: 100,
            color: theme.colors.shadePrimary,
            alignment: Alignment.center,
          ),
        ),
      ],
    );
  }
}
