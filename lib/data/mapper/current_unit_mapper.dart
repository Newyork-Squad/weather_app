import 'package:weather_app/data/dto/current_units_dto.dart';
import 'package:weather_app/data/model/current_units.dart';

extension CurrentUnitMapper on CurrentUnitsDto{
  CurrentUnit toDomain(){
    return CurrentUnit(
      time: time,
      interval: interval,
      temperature2m: temperature2m,
      relativeHumidity2m: relativeHumidity2m,
      apparentTemperature: apparentTemperature,
      isDay: isDay,
      precipitationProbability: precipitationProbability,
      weatherCode: weatherCode,
      surfacePressure: surfacePressure,
      windSpeed10m: windSpeed10m,
    );
  }
}