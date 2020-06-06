import 'package:flutter/material.dart';
import 'package:clutch/core/application.dart';
import 'package:flutter_translate/localization_delegate.dart';
import 'package:flutter_translate/localized_app.dart';


Future<void> main() async {
  var delegate = await LocalizationDelegate.create(
      fallbackLocale: 'ru',
      basePath: 'assets/i18n/', supportedLocales: [
    /*'en',*/
    'ru',
  ]);
 runApp(LocalizedApp(delegate, Application()));
}
