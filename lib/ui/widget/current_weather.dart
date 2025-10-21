import 'package:flutter/material.dart';

import '../designSystem/theme/weather_theme.dart';

class CurrentWeather extends StatefulWidget {
  const CurrentWeather({
    super.key,
    required this.temperature,
    required this.weatherIcon,
    required this.weatherMessage,
    required this.maxTemp,
    required this.minTemp,
  });

  final double temperature;
  final int weatherIcon;
  final String weatherMessage;
  final double maxTemp;
  final double minTemp;

  @override
  _CurrentWeatherState createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
  @override
  Widget build(BuildContext context) {
    const maxHeight = 480.0;
    const minHeight = 150.0;
    const titleWidth = 280.0;
    return SliverAppBar(
      collapsedHeight: minHeight,
      expandedHeight: maxHeight,
      backgroundColor: Colors.transparent,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          double currentHeight = constraints.biggest.height;
          const startPosition = 0.0;
          double finalPosition =
              (MediaQuery.of(context).size.width) -
              titleWidth -
              12; // width - titleWidth - padding
          double shrinkPercentage =
              (currentHeight - minHeight) / (maxHeight - minHeight);
          double xOffset =
              startPosition +
              (finalPosition - startPosition) * (1 - shrinkPercentage);
          return FlexibleSpaceBar(
            centerTitle: true,
            titlePadding: EdgeInsets.only(
              top: 0,
              left: 0,
              bottom: 24,
              right: 0,
            ),
            expandedTitleScale: 1.0,
            // Prevents default scaling
            title: Container(
              child: Transform.translate(
                offset: Offset(xOffset, 0),
                child: WeatherInfoColumn(
                  temperature: widget.temperature,
                  weatherMessage: widget.weatherMessage,
                  maxTemp: widget.maxTemp,
                  minTemp: widget.minTemp,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class WeatherInfoColumn extends StatefulWidget {
  final double temperature;
  final String weatherMessage;
  final double maxTemp;
  final double minTemp;

  const WeatherInfoColumn({
    super.key,
    required this.temperature,
    required this.weatherMessage,
    required this.maxTemp,
    required this.minTemp,
  });

  @override
  State<WeatherInfoColumn> createState() => _WeatherInfoColumnState();
}

class _WeatherInfoColumnState extends State<WeatherInfoColumn> {
  @override
  Widget build(BuildContext context) {
    final theme = MyWeatherTheme.of(context);
    final alphaShadePrimaryColor = theme.colors.shadePrimary.withValues(
      alpha: 0.6,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          '${widget.temperature.toInt()}°C',
          style: theme.typography.textTheme.headlineLarge?.copyWith(
            color: theme.colors.shadePrimary,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          widget.weatherMessage,
          style: theme.typography.textTheme.labelLarge?.copyWith(
            color: alphaShadePrimaryColor,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: theme.colors.shadePrimary.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_upward, color: alphaShadePrimaryColor),
              Text(
                '${widget.maxTemp}°C',
                style: theme.typography.textTheme.labelLarge?.copyWith(
                  color: alphaShadePrimaryColor,
                ),
              ),
              SizedBox(width: 10),
              Icon(Icons.arrow_downward, color: alphaShadePrimaryColor),
              Text(
                '${widget.minTemp}°C',
                style: theme.typography.textTheme.labelLarge?.copyWith(
                  color: alphaShadePrimaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
