import 'package:clutch/core/custom_route.dart';
import 'package:clutch/core/theme_custom.dart';
import 'package:clutch/domain/repository/auth_repository.dart';
import 'package:clutch/domain/repository/impl/auth_repository_impl.dart';
import 'package:clutch/helpers/security_manager.dart';
import 'package:clutch/ui/localization/keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class SplashScreen extends StatefulWidget {
  AuthRepository authRepository = AuthRepositoryImpl();

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
      body: Container(
          decoration: BoxDecoration(gradient: ThemeCustom.mainGradient),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(child: Image.asset("assets/images/logo.png")),
                Padding(
                  padding: const EdgeInsets.only(top: 36.0),
                  child: Text(
                    translate(Keys.Service_The_Best_Offers),
                    style: TextStyle(color: Colors.white, fontSize: 24.0),
                  ),
                )
              ],
            ),
          )));

  @override
  void initState() {
    super.initState();
    SecurityManager.isAuthorize().then((isAuthorize) {
      String screen = isAuthorize
          ? CustomRoute.MAIN_SCREEN
          : CustomRoute.SIGNIN_PHONE_SCREEN;
      widget.authRepository.isPaidAccess().then((value) {
        if (value.length == 0) {
          Navigator.pushNamed(context, CustomRoute.INVITE_CODE_SCREEN);
        } else {
          Navigator.pushNamed(context, screen);
        }
      });
    });
  }
}
