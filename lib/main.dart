import 'package:flutter/material.dart';
import 'package:weather_app/ui/designSystem/theme/AppThemeProvider.dart';
import 'package:weather_app/ui/designSystem/theme/weather_theme.dart';
import 'package:weather_app/ui/screen/home_screen.dart';

void main() {
  runApp(AppThemeProvider(brightness: Brightness.light, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = MyWeatherTheme.of(context);
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container( // Same background for the entire app
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              theme.colors.backgroundPrimary,
              theme.colors.backgroundSecondary,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(child: MyHomePage()), // SafeArea to avoid overlaps with system UI
      ),
    );
  }
}
