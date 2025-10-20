class CurrentUnits {
  final String? temperature2m;
  final String? apparentTemperature;
  final String? relativeHumidity2m;
  final String? windSpeed10m;
  final String? surfacePressure;

  CurrentUnits({
    this.temperature2m,
    this.apparentTemperature,
    this.relativeHumidity2m,
    this.windSpeed10m,
    this.surfacePressure,
  });

  factory CurrentUnits.fromJson(Map<String, dynamic> json) {
    return CurrentUnits(
      temperature2m: json['temperature_2m'],
      apparentTemperature: json['apparent_temperature'],
      relativeHumidity2m: json['relative_humidity_2m'],
      windSpeed10m: json['wind_speed_10m'],
      surfacePressure: json['surface_pressure'],
    );
  }
}