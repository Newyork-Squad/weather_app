import 'package:flutter/material.dart';
import 'package:weather_app/ui/widget/current_weather.dart';
import 'package:weather_app/ui/widget/weather_today_item_card.dart';
import 'package:weather_app/ui/widget/weather_today_widget.dart';

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
        // Placeholder for location
        /*SliverToBoxAdapter(
          child: Container(
            alignment: Alignment.center,
            color: Colors.black,
            width: 20,
            height: 30,
          ),
        ),*/
        CurrentWeather(
          temperature: 22.2,
          weatherIcon: 'assets/images/snow_fall_light_day.png',
          weatherMessage: "weatherMessage",
          maxTemp: 2.2,
          minTemp: 1.2,
        ),
        // Placeholder for yor widget
        /* SliverToBoxAdapter(
          child: Container(
            height: 300,
            width: 100,
            color: theme.colors.shadeSecondary,
            alignment: Alignment.center,
          ),
        ),*/
        SliverToBoxAdapter(
          child: WeatherTodayWidget(
            items: [
              WeatherItem(
                imagePath: 'assets/images/snow_fall_light_day.png',
                temperature: "20.0",
                hour: "10:00",
              ),
            ],
          ),
        ),
        // Placeholder for yor widget
        /*SliverToBoxAdapter(
          child: Container(
            height: 200,
            width: 100,
            color: theme.colors.glow,
            alignment: Alignment.center,
          ),
        ),*/
      ],
    );
  }
}
