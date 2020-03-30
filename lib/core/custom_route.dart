import 'package:flutter/material.dart';
import 'package:flutter_clutch_mobile/ui/screen/auth/signin_screen.dart';
import 'package:flutter_clutch_mobile/ui/screen/auth/signup_screen.dart';
import 'package:flutter_clutch_mobile/ui/screen/company_screen.dart';
import 'package:flutter_clutch_mobile/ui/screen/main_screen.dart';
import 'package:flutter_clutch_mobile/ui/screen/profile_screen.dart';
import 'package:flutter_clutch_mobile/ui/screen/settings_screen.dart';

class CustomRoute {
  static const String MAIN_SCREEN = '/';
  static const String SIGN_SCREEN = '/signin';
  static const String SIGNUP_SCREEN = '/signup';
  static const String PROFILE = '/profile';
  static const String SETTINGS = '/settings';
  static const String DETAILS_COMPANY = '/details_company';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget screen;
    final args = settings.arguments;
    switch (settings.name) {
      case PROFILE:
        screen = ProfileScreen();
        break;
      case SETTINGS:
        screen = SettingsScreen();
        break;
      case DETAILS_COMPANY:
        screen = CompanyScreen(args);
        break;
      case SIGN_SCREEN:
        screen = SignInScreen();
        break;
      case SIGNUP_SCREEN:
        screen = SignUpScreen();
        break;
      case MAIN_SCREEN:
        screen = MainScreen();
        break;
    }

    return MaterialPageRoute(
      builder: (_) => screen,
    );
  }
}
