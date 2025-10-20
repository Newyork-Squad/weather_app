import 'package:flutter/material.dart';

class WeeklyForecast extends StatelessWidget {
  const WeeklyForecast({super.key});

  final List<Map<String, dynamic>> forecastData = const [
    {'day': 'Monday', 'icon': Icons.wb_sunny_rounded, 'max': 32, 'min': 20},
    {'day': 'Tuesday', 'icon': Icons.cloud_rounded, 'max': 32, 'min': 20},
    {'day': 'Wednesday', 'icon': Icons.cloud_queue_rounded, 'max': 32, 'min': 20},
    {'day': 'Thursday', 'icon': Icons.wb_sunny_rounded, 'max': 32, 'min': 20},
    {'day': 'Friday', 'icon': Icons.cloud_rounded, 'max': 32, 'min': 20},
    {'day': 'Saturday', 'icon': Icons.wb_sunny_rounded, 'max': 32, 'min': 20},
    {'day': 'Sunday', 'icon': Icons.cloud_queue_rounded, 'max': 32, 'min': 20},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0B0712),
            Color(0xFF121022),
          ],
        ),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: Colors.white.withOpacity(0.08), width: 1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Title
          const Text(
            'Next 7 days',
            style: TextStyle(
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Colors.white,
              letterSpacing: 0.25,
            ),
          ),
          const SizedBox(height: 16),

          // 🔹 Forecast Rows
          Column(
            children: forecastData.map((day) {
              return Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.white.withOpacity(0.08),
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center, // ⬅ centers vertically
                  children: [
                    // Day text
                    Text(
                      day['day'],
                      style: const TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    // Centered icon
                    Icon(
                      day['icon'],
                      color: Colors.amberAccent,
                      size: 40,
                    ),

                    // Temperature text
                    Text(
                      '↑ ${day['max']}°C  ↓ ${day['min']}°C',
                      style: const TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 15,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
