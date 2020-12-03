import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GeoHelper {
  static Future<void> requestGeoPermissionIfNeed() async {
    var locationPermission = await Geolocator.checkPermission();
    if (locationPermission != LocationPermission.deniedForever) {
      await Geolocator.requestPermission();
    }
  }

  static Future<Position> detectPosition() async =>
      Geolocator.getCurrentPosition();

  static Future<LatLng> detectPositionLatLng() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return LatLng(position.latitude, position.longitude);
  }
}
