import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/ui/designSystem/theme/weather_theme.dart';

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
              placeholderBuilder: (context) {
                debugPrint('⚠️ Failed to load SVG: $icon');
                return Icon(
                  Icons.image_not_supported,
                  size: 32,
                  color: theme.colors.brand,
                );
              },
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