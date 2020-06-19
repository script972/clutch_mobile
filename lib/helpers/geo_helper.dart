import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class GeoHelper {

  static Future<void> requestGeoPermissionIfNeed() async {
    GeolocationStatus geolocationStatus  = await Geolocator().checkGeolocationPermissionStatus();
    if(geolocationStatus==GeolocationStatus.denied) {
      await Permission.location.request();
    }

  }

}