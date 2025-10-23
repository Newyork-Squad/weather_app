import 'package:flutter/material.dart';
import '../designSystem/theme/weather_theme.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/utils/weather_utils.dart';
import 'daily_card.dart';

class WeeklyForecastScreen extends StatelessWidget {

   WeeklyForecastScreen({super.key});

  final List<WeatherDayCard> weeklyForecast = [
    WeatherDayCard(
      day: "22/10/2025",
      maxTemp: 29,
      minTemp: 21,
      imagePath: getWeatherIconRes(0),

    ),
    WeatherDayCard(
      day: "23/10/2025",
      maxTemp: 28,
      minTemp: 20,
      imagePath: getWeatherIconRes(1),
    ),
    WeatherDayCard(
      day: "24/10/2025",
      maxTemp: 31,
      minTemp: 22,
      imagePath: getWeatherIconRes(0),
    ),
    WeatherDayCard(
      day: "25/10/2025",
      maxTemp: 30,
      minTemp: 19,
      imagePath: getWeatherIconRes(2),
    ),
    WeatherDayCard(
      day: "26/10/2025",
      maxTemp: 27,
      minTemp: 18,
      imagePath: getWeatherIconRes(3),

    ),
    WeatherDayCard(
      day: "27/10/2025",
      maxTemp: 27,
      minTemp: 18,
      imagePath: getWeatherIconRes(0),

    ),
    WeatherDayCard(
      day: "28/10/2025",
      maxTemp: 27,
      minTemp: 18,
      imagePath: getWeatherIconRes(2),

    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = MyWeatherTheme.of(context);

    return Scaffold(
      backgroundColor:theme.colors.backgroundPrimary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 24, left: 12,right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                "Next 7 days",
                style: theme.typography.textTheme.headlineMedium?.copyWith(
                color: theme.colors.shadePrimary,
                  fontWeight: FontWeight.w600,
          ),
              ),
              const SizedBox(height: 12),
                Container(
                  height:465,
                  decoration: BoxDecoration(
                    color: theme.colors.backgroundSecondary,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: theme.colors.strokeSecondary,
                      width: 1,

                  )),
                  child: ListView.builder(
                    itemCount: weeklyForecast.length >7
                        ? 7
                        : weeklyForecast.length,
                    itemBuilder: (context, index) {
                      final day = weeklyForecast[index];

                      return Column(
                        children: [
                          WeatherDayCard(
                            day:  DateFormat('EEEE').format(DateFormat('dd/MM/yyyy').parse(day.day)),
                            imagePath: day.imagePath,
                            maxTemp: day.maxTemp,
                            minTemp: day.maxTemp,
                          ),

                          /////////////
                          const SizedBox(height: 8),
                          Container(
                            height: 1,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: theme.colors.strokeSecondary,
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),

            ],
          ),
        ),
      ),
    );
  }
}

