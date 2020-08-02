import 'package:app_review/app_review.dart';
import 'package:clutch/core/custom_route.dart';
import 'package:clutch/presentation/bloc/profile_bloc.dart';
import 'package:clutch/presentation/event/profile_event.dart';
import 'package:clutch/ui/localization/keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/global.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingTab extends StatefulWidget {
  @override
  _SettingTabState createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  @override
  Widget build(BuildContext context) => Container(
      padding: EdgeInsets.only(top: 8.0),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.person),
            title: Text(translate(Keys.Profile)),
            onTap: () {
              BlocProvider.of<ProfileBloc>(context).add(LoadProfile());
              Navigator.pushNamed(context, CustomRoute.PROFILE);
            },
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text("Оцените нас"),
            onTap: () {
              AppReview.storeListing.then((onValue) {});
            },
          ),
          phoneAndNetwork("script972@gmail.com", "+380936629627")
        ],
      ));

  Widget phoneAndNetwork(String email, String phone) => Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Поддержка",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(translate(Keys.Phone_Number)),
                      ),
                      GestureDetector(
                          onTap: () {
                            launch("tel://${phone}");
                          },
                          child: Text(
                            phone.toString(),
                            style: TextStyle(color: Colors.lightBlue),
                          )),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(translate(Keys.Email)),
                      ),
                      GestureDetector(
                          onTap: () async {
                            launch("mailto:${email}");
                          },
                          child: Text(
                            email.toString(),
                            style: TextStyle(color: Colors.lightBlue),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      );
}
