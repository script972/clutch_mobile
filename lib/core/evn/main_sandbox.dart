import 'package:clutch/core/application.dart';
import 'package:clutch/domain/network/api_client.dart';
import 'package:clutch/helpers/geo_helper.dart';
import 'package:clutch/helpers/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/localization_delegate.dart';
import 'package:flutter_translate/localized_app.dart';
import 'package:get_it/get_it.dart';

Future<void> main() async {
  var delegate = await LocalizationDelegate.create(
      fallbackLocale: 'ru',
      basePath: 'assets/i18n/',
      supportedLocales: [
        /*'en',*/
        'ru',
      ]);

  if (!GetIt.I.isRegistered(instance: NavigationService())) {
    GetIt.I.registerLazySingleton(() => NavigationService());
  }
  GetIt.I.registerSingleton<Environment>(Environment.SANDBOX);
  await GeoHelper.requestGeoPermissionIfNeed();

  runApp(LocalizedApp(delegate, Application()));
}
