import 'package:flutter/material.dart';
import 'package:flutter_clutch_mobile/core/custom_route.dart';
import 'package:flutter_clutch_mobile/core/theme_custom.dart';
import 'package:flutter_clutch_mobile/ui/screen/profile_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(gradient: ThemeCustom.mainGradient),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(
                  child:
                      Image.asset("assets/images/ic_logo_vertical_white.png")),
            ),
            ListTile(
              leading: Image.asset("assets/images/ic_profile.png"),
              title: Text("Профиль"),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  CustomRoute.PROFILE,
                );
              },
            ),
            ListTile(
              leading: Image.asset("assets/images/ic_marker_position.png"),
              title: Text('Позиции'),
              onTap: () {},
            ),
            ListTile(
              leading: Image.asset("assets/images/ic_scaner.png"),
              title: Text('Корпоратка'),
              onTap: () {},
            ),
            ListTile(
              leading: Image.asset("assets/images/ic_transaction.png"),
              title: Text('Транзакции'),
              onTap: () {},
            ),
            ListTile(
              leading: Image.asset("assets/images/ic_gear.png"),
              title: Text('Настройка'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
