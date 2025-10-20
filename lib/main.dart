import 'package:flutter/material.dart';
import 'package:weather_app/services/weather_api_service.dart';
import 'package:weather_app/ui/designSystem/theme/AppThemeProvider.dart';
import 'package:weather_app/ui/designSystem/theme/weather_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    );
  }
}
