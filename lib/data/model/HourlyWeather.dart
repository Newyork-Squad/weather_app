class HourlyWeather {
  final String time;
  final double temperature;
  final int weatherCode;
  final int? isDay;

  HourlyWeather({
    required this.time,
    required this.temperature,
    required this.weatherCode,
    required this.isDay,
  });
}