import 'package:flutter/material.dart';
import 'package:weather_app/data/location_service.dart';
import 'package:weather_app/data/mapper/weather_response_mapper.dart';
import 'package:weather_app/data/weather_api_service.dart';
import 'package:weather_app/ui/designSystem/theme/weather_theme.dart';
import 'package:weather_app/ui/widget/current_location.dart';
import 'package:weather_app/ui/widget/current_weather.dart';
import 'package:weather_app/ui/widget/weather_today_item_card.dart';
import 'package:weather_app/ui/widget/weather_today_widget.dart';

import '../../utils/weather_utils.dart';
import '../widget/WeatherInfoGrid.dart';
import '../widget/daily_card.dart';
import '../widget/weakly_weather_widget.dart';

String _location = "UnKnown";
final WeatherApiService _weatherApi = WeatherApiService();

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    _fetchLocation();
  }

  Future<void> _fetchLocation() async {
    try {
      final LocationService locationService = LocationService();
      final LocationData locationData = await locationService
          .getCurrentLocation();
      final dto = await _weatherApi.getWeather(
        latitude: locationData.latitude,
        longitude: locationData.longitude,
      );
      final weatherDomainModel = dto.toDomain();
      final String fetchedLocation = weatherDomainModel.timezone ?? "Unknown";

      setState(() {
        _location = fetchedLocation;
      });
    } catch (e) {
      print('Error fetching location: $e');
      setState(() {
        _location = "Error when getting location";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = MyWeatherTheme.of(context);

    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: LocationDisplayComponent(locationName: _location),
        ),
        CurrentWeather(
          temperature: 22.2,
          weatherIcon: 'assets/images/snow_fall_light_day.png',
          weatherMessage: "weatherMessage",
          maxTemp: 2.2,
          minTemp: 1.2,
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 12,
              right: 12,
              top: 0,
              bottom: 24,
            ),
            child: WeatherInfoGrid(
              windSpeed: "5.0",
              humidity: "60",
              uvIndex: "3",
              pressure: "1013",
              feelsLike: "21.0",
              rainChance: "10",
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: WeatherTodayWidget(
            items: [
              WeatherItem(
                imagePath: 'assets/images/snow_fall_light_day.png',
                temperature: "20.0",
                hour: "10:00",
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: WeeklyForecastWidget(weeklyForecast: weeklyForecast),
        ),
      ],
    );
  }

  //dummy weekly data
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
}
