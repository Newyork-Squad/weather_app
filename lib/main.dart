import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/weather_api_service.dart';
import 'package:weather_app/ui/designSystem/theme/AppThemeProvider.dart';
import 'package:weather_app/ui/designSystem/theme/weather_theme.dart';
import 'package:weather_app/ui/screen/home_screen.dart';
import 'package:weather_app/ui/state/weather_cubit.dart';
import 'package:weather_app/ui/state/weather_state.dart';

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
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        Brightness brightness = Brightness.dark;
        // When weather is loaded, set brightness from isDay
        if (state is WeatherLoaded) {
          brightness = (state.weather.current?.isDay == 1)
              ? Brightness.light
              : Brightness.dark;
        }

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: AppThemeProvider(
            brightness: brightness,
            child: Material(
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: MyHomePage(),
              ),
            ),
          ),
        );
      },
    );
  }
}
