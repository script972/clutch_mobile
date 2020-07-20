import 'package:clutch/helpers/geo_helper.dart';
import 'package:clutch/helpers/navigation_service.dart';
import 'package:clutch/helpers/security_manager.dart';
import 'package:flutter/material.dart';
import 'package:clutch/core/application.dart';
import 'package:flutter_translate/localization_delegate.dart';
import 'package:flutter_translate/localized_app.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';


Future<void> main() async {
  var delegate = await LocalizationDelegate.create(
      fallbackLocale: 'ru',
      basePath: 'assets/i18n/', supportedLocales: [
    /*'en',*/
    'ru',
  ]);

  await GeoHelper.requestGeoPermissionIfNeed();
  if (!GetIt.I.isRegistered(instance:NavigationService())) {
    GetIt.I.registerLazySingleton(() => NavigationService());
  }
  runApp(LocalizedApp(delegate, Application()));
}
