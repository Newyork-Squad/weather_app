String getWeatherIconRes(int weatherCode,{bool isDay = true}  ) {
  switch (weatherCode) {
    case 0:
      return isDay
          ? 'assets/images/clear_sky.png'
          : 'assets/images/clear_sky_night.png';
    case 1:
      return isDay
          ? 'assets/images/mainly_clear.png'
          : 'assets/images/mainly_clear_night.png';
    case 2:
      return isDay
          ? 'assets/images/partly_cloudy.png'
          : 'assets/images/partly_cloudy_night.png';
    case 3:
      return isDay
          ? 'assets/images/overcast.png'
          : 'assets/images/overcast_night.png';
    case 45:
      return isDay
          ? 'assets/images/fog.png'
          : 'assets/images/fog_night.png';
    case 48:
      return isDay
          ? 'assets/images/depositing_rime_fog.png'
          : 'assets/images/depositing_rime_fog_night.png';
    case 51:
      return isDay
          ? 'assets/images/drizzle_light.png'
          : 'assets/images/drizzle_light_night.png';
    case 53:
      return isDay
          ? 'assets/images/drizzle_moderate.png'
          : 'assets/images/drizzle_moderate_night.png';
    case 55:
      return isDay
          ? 'assets/images/drizzle_intensity.png'
          : 'assets/images/drizzle_intensity_night.png';
    case 56:
      return isDay
          ? 'assets/images/freezing_drizzle_light.png'
          : 'assets/images/freezing_drizzle_light_night.png';
    case 57:
      return isDay
          ? 'assets/images/freezing_drizzle_intensity.png'
          : 'assets/images/freezing_drizzle_intensity_night.png';
    case 61:
      return isDay
          ? 'assets/images/rain_slight.png'
          : 'assets/images/rain_slight_night.png';
    case 63:
      return isDay
          ? 'assets/images/rain_moderate.png'
          : 'assets/images/rain_moderate_night.png';
    case 65:
      return isDay
          ? 'assets/images/rain_intensity.png'
          : 'assets/images/rain_intensity_night.png';
    case 66:
      return isDay
          ? 'assets/images/freezing_light.png'
          : 'assets/images/freezing_light_night.png';
    case 67:
      return isDay
          ? 'assets/images/freezing_heavy.png'
          : 'assets/images/freezing_heavy_night.png';
    case 71:
      return isDay
          ? 'assets/images/rain_slight.png'
          : 'assets/images/rain_slight_night.png';
    case 73:
      return isDay
          ? 'assets/images/snow_fall_moderate.png'
          : 'assets/images/snow_fall_moderate_night.png';
    case 75:
      return isDay
          ? 'assets/images/snow_fall_intensity.png'
          : 'assets/images/snow_fall_intensity_night.png';
    case 77:
      return isDay
          ? 'assets/images/snow_grains.png'
          : 'assets/images/snow_grains_night.png';
    case 80:
      return isDay
          ? 'assets/images/rain_shower_slight.png'
          : 'assets/images/rain_shower_slight_night.png';
    case 81:
      return isDay
          ? 'assets/images/rain_shower_moderate.png'
          : 'assets/images/rain_shower_moderate_night.png';
    case 82:
      return isDay
          ? 'assets/images/snow_shower_slight.png'
          : 'assets/images/rain_shower_violent_night.png';
    case 85:
      return isDay
          ? 'assets/images/snow_shower_slight.png'
          : 'assets/images/snow_shower_slight_night.png';
    case 86:
      return isDay
          ? 'assets/images/snow_shower_heavy.png'
          : 'assets/images/snow_shower_heavy_night.png';
    case 95:
      return isDay
          ? 'assets/images/thunderstrom_slight_or_moderate.png'
          : 'assets/images/thunderstrom_slight_or_moderate_night.png';
    case 96:
      return isDay
          ? 'assets/images/thunderstrom_with_slight_hail.png'
          : 'assets/images/thunderstrom_with_slight_hail_night.png';
    case 99:
      return isDay
          ? 'assets/images/thunderstrom_with_heavy_hail.png'
          : 'assets/images/thunderstrom_with_heavy_hail_night.png';
    default:
      return 'assets/images/ic_launcher_background.png';
  }}

  String mapWeatherCodeToDescription(int? code) {
    switch (code) {
      case 0:
        return "Clear sky";
      case 1:
        return "Mainly clear";
      case 2:
        return "Partly cloudy";
      case 3:
        return "Overcast";
      case 45:
        return "Fog";
      case 48:
        return "Depositing rime fog";
      case 51:
        return "Drizzle: Light intensity";
      case 53:
        return "Drizzle: Moderate intensity";
      case 55:
        return "Drizzle: Dense intensity";
      case 56:
        return "Freezing Drizzle: Light intensity";
      case 57:
        return "Freezing Drizzle: Dense intensity";
      case 61:
        return "Rain: Slight";
      case 63:
        return "Rain: Moderate";
      case 65:
        return "Rain: Heavy intensity";
      case 66:
        return "Freezing Rain: Light intensity";
      case 67:
        return "Freezing Rain: Heavy intensity";
      case 71:
        return "Snow fall: Slight intensity";
      case 73:
        return "Snow fall: Moderate intensity";
      case 75:
        return "Snow fall: Heavy intensity";
      case 77:
        return "Snow grains";
      case 80:
        return "Rain showers: Slight";
      case 81:
        return "Rain showers: Moderate";
      case 82:
        return "Rain showers: Violent";
      case 85:
        return "Snow showers: Slight";
      case 86:
        return "Snow showers: Heavy";
      case 95:
        return "Thunderstorm: Slight or moderate";
      case 96:
        return "Thunderstorm with slight hail";
      case 99:
        return "Thunderstorm with heavy hail";
      default:
        return "Unknown";
    }
  }


String extractHourMinute(String isoDateTime) {
  final dateTimeParts = isoDateTime.split('T');
  if (dateTimeParts.length != 2) return "";
  final timePart = dateTimeParts[1];
  final segments = timePart.split(':');
  if (segments.length < 2) return "";
  final hour = int.tryParse(RegExp(r'\d+').stringMatch(segments[0]) ?? '') ?? 0;
  final minuteStr = RegExp(r'\d{1,2}').stringMatch(segments[1]) ?? '00';
  final minute = int.tryParse(minuteStr) ?? 0;
  final period = hour >= 12 ? '' : '';
  var hour12 = hour % 12;
  if (hour12 == 0) hour12 = 12;
  return '${hour12}:${minute.toString().padLeft(2, '0')} $period';
}


String getDayName(String date) {
  // Expects date in format: "YYYY-MM-DD"
  try {
    final parsedDate = DateTime.parse(date);
    const weekdays = [
      "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"
    ];
    // DateTime.weekday returns [1..7] where 1 is Monday
    return weekdays[parsedDate.weekday - 1];
  } catch (e) {
    return "";
  }
}


String removeDecimal(String value) {
  if (value.contains('.')) {
    return value.substring(0, value.indexOf('.'));
  }
  return value;
}