import 'package:clutch/ui/screen/offer_screen.dart';
import 'package:flutter/material.dart';
import 'package:clutch/ui/screen/auth/signin_phone_screen.dart';
import 'package:clutch/ui/screen/auth/signup_sms_code_screen.dart';
import 'package:clutch/ui/screen/company_screen.dart';
import 'package:clutch/ui/screen/main_screen.dart';
import 'package:clutch/ui/screen/profile_screen.dart';
import 'package:clutch/ui/screen/settings_screen.dart';

class CustomRoute {
  static const String MAIN_SCREEN = '/';
  static const String SIGNIN_PHONE_SCREEN = '/signin';
  static const String SIGNUP_SCREEN = '/signup';
  static const String PROFILE = '/profile';
  static const String SETTINGS = '/settings';
  static const String DETAILS_COMPANY = '/details_company';
  static const String DETAILS_OFFER = '/details_offer';

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
      case SIGNIN_PHONE_SCREEN:
        screen = SignInPhoneScreen();
        break;
      case SIGNUP_SCREEN:
        screen = SignUpSmsCodeScreen();
        break;
      case MAIN_SCREEN:
        screen = MainScreen();
        break;
      case DETAILS_OFFER:
        screen = OfferScreen();
        break;
    }

    return MaterialPageRoute(
      builder: (_) => screen,
    );
  }
}
