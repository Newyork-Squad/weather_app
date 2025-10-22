import 'package:weather_app/data/dto/hourly_units_dto.dart';
import 'package:weather_app/data/model/hourly_units.dart';

extension HourlyUnitMapper on HourlyUnitsDto{
  HourlyUnits toDomain() {
    return HourlyUnits(
      time: time,
      temperature2m: temperature2m,
      weathercode: weathercode,
    );
  }
}