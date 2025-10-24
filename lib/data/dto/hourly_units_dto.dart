class HourlyUnitsDto {
  final String? time;
  final String? temperature2m;
  final String? weathercode;
  final String? isDay;

  HourlyUnitsDto({
    this.time,
    this.temperature2m,
    this.weathercode,
    this.isDay,
  });

  factory HourlyUnitsDto.fromJson(Map<String, dynamic> json) {
    return HourlyUnitsDto(
      time: json['time'] as String?,
      temperature2m: json['temperature_2m'] as String?,
      weathercode: json['weathercode'] as String?,
      isDay: json['is_day'] as String?,
    );
  }

}