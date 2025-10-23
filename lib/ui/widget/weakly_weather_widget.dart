import 'package:flutter/material.dart';
import '../designSystem/theme/weather_theme.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/utils/weather_utils.dart';
import 'daily_card.dart';

class WeeklyForecastScreen extends StatelessWidget {
  final List<WeatherDayCard> weeklyForecast;

  const WeeklyForecastScreen({super.key, required this.weeklyForecast});

  @override
  Widget build(BuildContext context) {
    final theme = MyWeatherTheme.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 12, right: 12),
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
            height: 465,
            decoration: BoxDecoration(
              color: theme.colors.backgroundSecondary,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: theme.colors.strokeSecondary, width: 1),
            ),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: weeklyForecast.length >7 ? 7 : weeklyForecast.length,
              itemBuilder: (context, index) {
                final day = weeklyForecast[index];

                return Column(
                  children: [
                    WeatherDayCard(
                      day: DateFormat(
                        'EEEE',
                      ).format(DateFormat('dd/MM/yyyy').parse(day.day)),
                      imagePath: day.imagePath,
                      maxTemp: day.maxTemp,
                      minTemp: day.minTemp,
                    ),

                    /////////////
                    const SizedBox(height: 4),
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
    );
  }
}
