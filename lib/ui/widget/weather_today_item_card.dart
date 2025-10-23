import 'package:flutter/material.dart';
import 'package:weather_app/ui/designSystem/theme/weather_theme.dart';

class WeatherItem {
  final String imagePath;
  final String temperature;
  final String hour;

  WeatherItem({
    required this.imagePath,
    required this.temperature,
    required this.hour,
  });
}

class WeatherItemWidget extends StatelessWidget {
  final WeatherItem item;

  const WeatherItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = MyWeatherTheme.of(context);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 80,
          height: 120,
          margin: const EdgeInsets.only(top: 8),
          padding: const EdgeInsets.only(
            top: 36,
            bottom: 16,
            left: 12,
            right: 12,
          ),
          decoration: BoxDecoration(
            color: theme.colors.backgroundSecondary.withValues(alpha: 0.7),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: theme.colors.strokePrimary, width: 1),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              Text(
                item.temperature,
                style: theme.typography.textTheme.titleMedium?.copyWith(
                  color: theme.colors.shadeSecondary,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                item.hour,
                style: theme.typography.textTheme.labelMedium?.copyWith(
                  color: theme.colors.shadePrimary.withValues(alpha: 0.6),
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),

        Positioned(
          top: -5,
          left: 0,
          right: 0,
          child: Center(
            child: Image.asset(
              item.imagePath,
              width: 58,
              height: 58,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
