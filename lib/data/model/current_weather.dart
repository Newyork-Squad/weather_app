class CurrentWeather{
  final String? time;
  final int? interval;
  final double? temperature2m;
  final int? relativeHumidity2m;
  final double? apparentTemperature;
  final int? isDay;
  final int? precipitationProbability;
  final int? weatherCode;
  final double? surfacePressure;
  final double? windSpeed10m;

  CurrentWeather({
    this.time,
    this.interval,
    this.temperature2m,
    this.relativeHumidity2m,
    this.apparentTemperature,
    this.isDay,
    this.precipitationProbability,
    this.weatherCode,
    this.surfacePressure,
    this.windSpeed10m,
  });
}