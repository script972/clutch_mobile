import 'package:clutch/helpers/geo_helper.dart';
import 'package:clutch/helpers/security_manager.dart';
import 'package:flutter/material.dart';
import 'package:clutch/core/application.dart';
import 'package:flutter_translate/localization_delegate.dart';
import 'package:flutter_translate/localized_app.dart';
import 'package:geolocator/geolocator.dart';


Future<void> main() async {
  var delegate = await LocalizationDelegate.create(
      fallbackLocale: 'ru',
      basePath: 'assets/i18n/', supportedLocales: [
    /*'en',*/
    'ru',
  ]);

  await GeoHelper.requestGeoPermissionIfNeed();
  bool isAuthorize = await SecurityManager.isAuthorize();
  runApp(LocalizedApp(delegate, Application(isAuthorize)));
}
