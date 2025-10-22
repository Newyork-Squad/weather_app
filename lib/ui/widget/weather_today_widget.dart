import 'package:flutter/material.dart';
import 'package:weather_app/ui/designSystem/theme/weather_theme.dart';
import 'package:weather_app/ui/widget/weather_today_item_card.dart';

class WeatherTodayWidget extends StatelessWidget {
  final List<WeatherItem> items;

  const WeatherTodayWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final theme = MyWeatherTheme.of(context);
    return Container(
      decoration: BoxDecoration(color: theme.colors.backgroundPrimary),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              'Today',
              style: theme.typography.textTheme.headlineMedium?.copyWith(
                color: theme.colors.shadePrimary,
              ),
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 180,
            child: ListView.separated(
              itemCount: items.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              separatorBuilder: (context, index) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                return WeatherItemWidget(item: items[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
