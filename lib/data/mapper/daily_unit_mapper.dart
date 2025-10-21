import 'package:weather_app/data/dto/daily_units_dto.dart';
import 'package:weather_app/data/model/daily_units.dart';

extension DailyUnitMapper on DailyUnitsDto {
  DailyUnit toDomain() {
    return DailyUnit(
      time: time,
      temperature2mMax: temperature2mMax,
      temperature2mMin: temperature2mMin,
      weathercode: weathercode,
      uvIndexMax: uvIndexMax,
    );
  }
}
