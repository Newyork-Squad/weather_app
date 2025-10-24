import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/weather_api_service.dart';
import 'package:weather_app/ui/designSystem/theme/AppThemeProvider.dart';
import 'package:weather_app/ui/designSystem/theme/weather_theme.dart';
import 'package:weather_app/ui/screen/home_screen.dart';
import 'package:weather_app/ui/state/weather_cubit.dart';
import 'package:weather_app/ui/widget/weekly_weather_widget.dart';

import 'data/location_service.dart';
import 'data/repository_impl.dart';

void main() {
  final weatherRepository = WeatherRepositoryImpl(
    weatherApiService: WeatherApiService(),
    locationService: LocationService(),
  );
  runApp(
    BlocProvider(
      create: (_) => WeatherCubit(weatherRepository),
      child: AppThemeProvider(
        brightness: Brightness.light,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const MyApp(),
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = MyWeatherTheme.of(context);
    return Material(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
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
          child: const SafeArea(
            child: MyHomePage(),
          ),
        ),
      ),
    );
  }
}

