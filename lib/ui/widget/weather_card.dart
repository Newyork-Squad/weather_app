import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/ui/designSystem/theme/weather_theme.dart';

class WeatherCard extends StatelessWidget {
  final String icon;
  final String value;
  final String label;
  final String? unit;

  const WeatherCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
    this.unit,
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
          SvgPicture.asset(
            icon,
            width: 32,
            height: 32,
            colorFilter: ColorFilter.mode(
              theme.colors.brand,
              BlendMode.srcIn,
            ),
          ),

          const SizedBox(height: 8),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: theme.typography.textTheme.labelLarge?.copyWith(
                color: theme.colors.shadePrimary,
              ),
              children: [
                TextSpan(text: value),
                if (unit != null)
                  TextSpan(
                    text: ' $unit',
                    style: theme.typography.textTheme.labelSmall?.copyWith(
                      color: theme.colors.shadeSecondary,
                    ),
                  ),
              ],
            ),
          ),

          const SizedBox(height: 4),

          Text(
            label,
            textAlign: TextAlign.center,
            style: theme.typography.textTheme.labelSmall?.copyWith(
              color: theme.colors.shadeSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
