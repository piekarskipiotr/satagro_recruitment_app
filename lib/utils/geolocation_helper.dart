import 'package:geolocator/geolocator.dart';

class GeolocationHelper {
  static Future<void> checkPermissionStatus() async {
    final isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationServiceEnabled) throw Exception('Location services are disabled.');

    final status = await Geolocator.requestPermission();
    switch (status) {
      case LocationPermission.denied:
      case LocationPermission.deniedForever:
        throw Exception('Location permissions are denied.');
      case _:
        break;
    }
  }

  static Future<Position> getCurrentLocation() async {
    const locationSettings = LocationSettings(accuracy: LocationAccuracy.high);
    return Geolocator.getCurrentPosition(locationSettings: locationSettings);
  }
}
