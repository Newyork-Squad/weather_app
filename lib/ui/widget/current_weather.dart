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
    final theme = MyWeatherTheme.of(context);
    final alphaShadePrimaryColor = theme.colors.shadePrimary.withValues(
      alpha: 0.6,
    );
    return SliverAppBar(
      collapsedHeight: 145.0,
      expandedHeight: 480.0,
      backgroundColor: Colors.transparent,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          // Calculate the shrink percentage
          var t =
              (constraints.maxHeight - kToolbarHeight) / (250 - kToolbarHeight);
          t = t.clamp(0.0, 1.0);

          // Interpolate size & position
          final double scale = 1.0 + (t * 0.5); // grows when expanded
          final double opacity = t;

          return FlexibleSpaceBar(
            centerTitle: true,
            titlePadding: const EdgeInsets.only(bottom: 16),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '${widget.temperature}°C',
                  style: theme.typography.textTheme.headlineLarge?.copyWith(
                    color: theme.colors.shadePrimary,
                  ),
                ),
                Text(
                  widget.weatherMessage,
                  style: theme.typography.textTheme.labelLarge?.copyWith(
                    color: alphaShadePrimaryColor,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: theme.colors.shadePrimary.withValues(
                      alpha: 0.08,
                    ),
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
            ),
            background: Image(
              image: AssetImage('assets/images/snow_fall_light_day.png'),
              width: 200,
              height: 200,
              fit: BoxFit.cover, // Optional: set fit
            ),
          );
        },
      ),
    );
  }
}
