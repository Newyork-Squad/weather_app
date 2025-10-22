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
    const maxHeight = 390.0;
    const minHeight = 215.0;
    const titleWidth = 145.0;
    return SliverAppBar(
      floating: true,
      collapsedHeight: minHeight,
      expandedHeight: maxHeight,
      backgroundColor: Colors.transparent,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          double currentHeight = constraints.biggest.height;
          double screenWidth = MediaQuery.of(context).size.width;
          double shrinkPercentage =
              (currentHeight - minHeight) / (maxHeight - minHeight);
          double detailsRightPadding =
              ((screenWidth / 2 - titleWidth / 2) * shrinkPercentage).clamp(
                12.0,
                double.infinity,
              );
          double imageWidth = 255.0;
          double imageLeftPadding =
              ((screenWidth / 2 - imageWidth / 2) * shrinkPercentage).clamp(
                12.0,
                double.infinity,
              );

          return FlexibleSpaceBar(
            centerTitle: true,
            titlePadding: EdgeInsets.only(top: 0, left: 0, bottom: 0, right: 0),
            expandedTitleScale: 1.0,
            // Prevents default scaling
            title: Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  left: imageLeftPadding,
                  bottom: currentHeight - minHeight - 20,
                  child: Transform.scale(
                    alignment: Alignment.centerLeft,
                    scale: shrinkPercentage.clamp(0.8, 1.0),
                    child: Image(
                      image: AssetImage(
                        'assets/images/snow_fall_light_day.png',
                      ),
                      width: imageWidth,
                      height: 215,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  right: detailsRightPadding,
                  bottom: 24,
                  child: WeatherInfoColumn(
                    temperature: widget.temperature,
                    weatherMessage: widget.weatherMessage,
                    maxTemp: widget.maxTemp,
                    minTemp: widget.minTemp,
                  ),
                ),
              ],
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
