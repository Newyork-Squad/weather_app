class CurrentWeather {
  final double? temperature2m;
  final double? apparentTemperature;
  final int? weatherCode;
  final double? relativeHumidity2m;
  final double? windSpeed10m;
  final double? precipitationProbability;
  final double? surfacePressure;
  final int? isDay;

  CurrentWeather({
    this.temperature2m,
    this.apparentTemperature,
    this.weatherCode,
    this.relativeHumidity2m,
    this.windSpeed10m,
    this.precipitationProbability,
    this.surfacePressure,
    this.isDay,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      temperature2m: json['temperature_2m']?.toDouble(),
      apparentTemperature: json['apparent_temperature']?.toDouble(),
      weatherCode: json['weather_code'],
      relativeHumidity2m: json['relative_humidity_2m']?.toDouble(),
      windSpeed10m: json['wind_speed_10m']?.toDouble(),
      precipitationProbability: json['precipitation_probability']?.toDouble(),
      surfacePressure: json['surface_pressure']?.toDouble(),
      isDay: json['is_day'],
    );
  }
}