import 'package:flutter/material.dart';
import '../designSystem/theme/weather_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeatherDayCard extends StatelessWidget {
  final String day;
  final String imagePath;
  final int maxTemp;
  final int minTemp;

  const WeatherDayCard({
    super.key,
    required this.day,
    required this.imagePath,
    required this.maxTemp,
    required this.minTemp,
  });

  @override
  Widget build(BuildContext context) {
    final theme = MyWeatherTheme.of(context);

    return Container(
        height: 61,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              SizedBox(
                width: 90,
                child: Text(
                  day,
                  style: theme.typography.textTheme.labelLarge?.copyWith(
                    color: theme.colors.shadeQuaternary.withValues(alpha: 0.6),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                width: 40,
                child: Image.asset(
                  imagePath,
                  height: 40,
                  width: 40,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: SvgPicture.asset(
                        'assets/icons/ic_arrow_up.svg',
                        width: 12,
                        height: 12,
                        colorFilter: ColorFilter.mode(
                          theme.colors.shadeSecondary,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    Text(
                      '${maxTemp}°C',
                      style: theme.typography.textTheme.labelLarge?.copyWith(
                        color: theme.colors.shadeSecondary,
                      ),
                    ),
                    RotatedBox(
                      quarterTurns: 1,
                      child: Icon(
                        Icons.horizontal_rule,
                        color: theme.colors.strokeSecondary,
                        size: 18,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: SvgPicture.asset(
                        'assets/icons/ic_arrow_down.svg',
                        width: 12,
                        height: 12,
                        colorFilter: ColorFilter.mode(
                          theme.colors.shadeSecondary,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    Text(
                      '${minTemp}°C',
                      style: theme.typography.textTheme.labelLarge?.copyWith(
                        color: theme.colors.shadeSecondary,
                      ),
                    ),
                  ],
                ),)
            ]));
  }
}
