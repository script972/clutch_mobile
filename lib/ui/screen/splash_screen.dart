import 'package:clutch/core/custom_route.dart';
import 'package:clutch/domain/repository/auth_repository.dart';
import 'package:clutch/domain/repository/impl/auth_repository_impl.dart';
import 'package:clutch/helpers/security_manager.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthRepository authRepository = AuthRepositoryImpl();

  @override
  void initState() {
    super.initState();
    var screen = CustomRoute.MAIN_SCREEN;
    SecurityManager.isAuthorize().then((isAuthorize) async {
      if (!isAuthorize) {
        screen = CustomRoute.SIGNIN_PHONE_SCREEN;
      } else {
        var paidAcces = await SecurityManager.checkPaidAccess();
        if (!paidAcces.hasAccess) {
          screen = paidAcces.screen;
        }
      }
      await Navigator.pushNamedAndRemoveUntil(
          context, screen, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[],
      );
}
