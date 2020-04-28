import 'package:flutter/material.dart';
import 'package:clutch/core/application.dart';
import 'package:flutter_translate/localization_delegate.dart';
import 'package:flutter_translate/localized_app.dart';


Future<void> main() async {
  var delegate = await LocalizationDelegate.create(
      fallbackLocale: 'en',
      basePath: 'assets/i18n/', supportedLocales: [
    'en',
    'fr',
  ]);
 runApp(LocalizedApp(delegate, Application()));
}
