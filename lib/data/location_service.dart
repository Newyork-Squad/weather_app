import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationData {
  final double latitude;
  final double longitude;
  final String cityName;

  LocationData({
    required this.latitude,
    required this.longitude,
    required this.cityName,
  });
}

class LocationService {
  Future<LocationData> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permission denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permission permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    String cityName = 'Unknown';
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        cityName =
            place.locality ??
            place.subAdministrativeArea ??
            place.administrativeArea ??
            'Unknown';
      }
    } catch (e) {
      print('Error getting city name: $e');
    }

    return LocationData(
      latitude: position.latitude,
      longitude: position.longitude,
      cityName: cityName,
    );
  }
}
