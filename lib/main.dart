import 'package:clutch/core/application.dart';
import 'package:clutch/domain/repository/auth_repository.dart';
import 'package:clutch/domain/repository/impl/auth_repository_impl.dart';
import 'package:clutch/helpers/geo_helper.dart';
import 'package:clutch/helpers/navigation_service.dart';
import 'package:clutch/helpers/security_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/localization_delegate.dart';
import 'package:flutter_translate/localized_app.dart';
import 'package:get_it/get_it.dart';

import 'core/custom_route.dart';
import 'domain/network/model/response/company_with_paid_access.dart';

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
  await GeoHelper.requestGeoPermissionIfNeed();

  runApp(LocalizedApp(delegate, Application()));

}
