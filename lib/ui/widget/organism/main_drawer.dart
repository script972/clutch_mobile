import 'package:clutch/core/custom_route.dart';
import 'package:clutch/core/theme_custom.dart';
import 'package:clutch/ui/localization/keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/global.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Drawer(
        child: Container(
          decoration: BoxDecoration(gradient: ThemeCustom.mainGradient),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Center(
                    child: Image.asset(
                        'assets/images/ic_logo_vertical_white.png')),
              ),
              menuItem(Image.asset('assets/images/ic_profile.png'),
                  translate(Keys.Profile), () {
                Navigator.pushNamed(
                  context,
                  CustomRoute.PROFILE,
                );
              }),
              /*menuItem(Image.asset('assets/images/ic_marker_position.png'),
                'Позиции', () {}),
            menuItem(Image.asset('assets/images/ic_scaner.png'), 'Корпоратка',
                () {}),
            menuItem(Image.asset('assets/images/ic_transaction.png'),
                'Транзакции', () {}),*/
              menuItem(
                  Image.asset('assets/images/ic_gear.png'), 'Настройка', () {}),
              Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 28.0, left: 16.0, right: 16.0),
                      child: FloatingActionButton(
                        heroTag: 'share',
                        onPressed: () {},
                        child: Icon(Icons.share),
                        elevation: 0,
                        backgroundColor: Colors.white.withOpacity(0.0),
                        shape: CircleBorder(
                            side: BorderSide(
                                color: Colors.white.withOpacity(.2))),
                      ),
                    ),
                    /*Padding(
                    padding: const EdgeInsets.only(
                        bottom: 28.0, left: 16.0, right: 16.0),
                    child: FloatingActionButton(
                      heroTag: 'exit',
                      onPressed: () {
                        Navigator.pushNamed(context, '/SliverAppBarScreen');
                      },
                      child: Icon(Icons.exit_to_app),
                      elevation: 0,
                      backgroundColor: Colors.white.withOpacity(0.0),
                      shape: CircleBorder(
                          side:
                              BorderSide(color: Colors.white.withOpacity(.2))),
                    ),
                  )*/
                  ],
                ),
              )
            ],
          ),
        ),
      );

  Widget menuItem(Image image, String title, Function onTap) => Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: ListTile(
            leading: image,
            title: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      );
}
