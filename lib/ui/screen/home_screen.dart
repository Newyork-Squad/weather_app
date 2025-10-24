import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/ui/designSystem/theme/weather_theme.dart';
import 'package:weather_app/ui/widget/current_location.dart';
import 'package:weather_app/ui/widget/current_weather.dart';
import 'package:weather_app/ui/widget/weather_today_item_card.dart';
import 'package:weather_app/ui/widget/weather_today_widget.dart';
import '../../utils/weather_utils.dart';
import '../state/weather_cubit.dart';
import '../state/weather_state.dart';
import '../widget/WeatherInfoGrid.dart';
import '../widget/daily_card.dart';
import '../widget/weekly_weather_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherCubit>().fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    final theme = MyWeatherTheme.of(context);

    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is WeatherLoaded) {
          final weather = state.weather;
          return CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: LocationDisplayComponent(
                  locationName: weather.timezone ?? "Unknown",
                ),
              ),
              CurrentWeather(
                temperature: weather.current?.temperature2m ?? 0,
                weatherIcon: getWeatherIconRes(
                  weather.current?.weatherCode ?? 1,
                ),
                weatherMessage: mapWeatherCodeToDescription(weather.current?.weatherCode),
                maxTemp: weather.daily.isNotEmpty ? weather.daily[0]
                    .maxTemp : 0,
                minTemp: weather.daily.isNotEmpty ? weather.daily[0]
                    .minTemp : 0,
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, top: 0, bottom: 24),
                  child: WeatherInfoGrid(
                    windSpeed: "${weather.current?.windSpeed10m ?? ''}",
                    humidity: "${weather.current?.relativeHumidity2m ?? ''}",
                    uvIndex: "${weather.daily[0].uvIndex}",
                    pressure: "${weather.current?.surfacePressure ?? ''}",
                    feelsLike: "${weather.current?.apparentTemperature ?? ''}",
                    rainChance: "${weather.current?.precipitationProbability ?? ''}",
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: WeatherTodayWidget(
                  items: weather.hourly.map((hour) =>
                      WeatherItem(
                        imagePath: getWeatherIconRes(hour.weatherCode),
                        temperature: "${hour.temperature}",
                        hour: hour.time,
                      )).toList(),
                ),
              ),
              SliverToBoxAdapter(
                child: WeeklyForecastWidget(
                  weeklyForecast: weather.daily.map((day) =>
                      WeatherDayCard(
                        day: day.date,
                        maxTemp: day.maxTemp.toInt(),
                        minTemp: day.minTemp.toInt(),
                        imagePath: getWeatherIconRes(day.weatherCode),
                      )).toList(),
                ),
              ),
            ],
          );
        } else if (state is WeatherError) {
          return Center(child: Text('Error: ${state.message}'));
        }
        return const SizedBox();
      },
    );
  }}
