class DailyWeather {
  final String date;
  final double maxTemp;
  final double minTemp;
  final int weatherCode;
  final double uvIndex;

  DailyWeather({
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCode,
    required this.uvIndex,
  });
}