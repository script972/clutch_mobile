import 'package:clutch/ui/screen/auth/email_verified_code_screen.dart';
import 'package:clutch/ui/screen/auth/email_verified_screen.dart';
import 'package:clutch/ui/screen/auth/invite_code_screen.dart';
import 'package:clutch/ui/screen/auth/signin_phone_screen.dart';
import 'package:clutch/ui/screen/auth/signup_sms_code_screen.dart';
import 'package:clutch/ui/screen/company_screen.dart';
import 'package:clutch/ui/screen/main_screen.dart';
import 'package:clutch/ui/screen/offer_screen.dart';
import 'package:clutch/ui/screen/profile_screen.dart';
import 'package:clutch/ui/screen/splash_screen.dart';
import 'package:flutter/material.dart';

class CustomRoute {
  ///EmailVerifiedCodeScreen

  static const String SPLASH_SCREEN = '/';
  //auth
  static const String SIGNIN_PHONE_SCREEN = '/signin';
  static const String SIGNUP_SCREEN = '/signup';
  static const String EMAIL_VERIFIED_SCREEN = '/email_verified_screen';
  static const String EMAIL_VERIFIED_CODE_SCREEN =
      '/email_verified_code_screen';
  static const String INVITE_CODE_SCREEN = '/invite_code';

  //main
  static const String MAIN_SCREEN = '/main';
  static const String PROFILE = '/profile';
  static const String DETAILS_COMPANY = '/details_company';
  static const String DETAILS_OFFER = '/details_offer';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget screen;
    switch (settings.name) {
      case SPLASH_SCREEN:
        screen = SplashScreen();
        break;
      case EMAIL_VERIFIED_SCREEN:
        screen = EmailVerifiedScreen();
        break;
      case EMAIL_VERIFIED_CODE_SCREEN:
        screen = EmailVerifiedCodeScreen();
        break;
      case PROFILE:
        screen = ProfileScreen();
        break;
      case DETAILS_COMPANY:
        screen = CompanyScreen();
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
      case INVITE_CODE_SCREEN:
        screen = InviteCodeScreen();
        break;
    }

    return MaterialPageRoute(
      builder: (_) => screen,
    );
  }
}
