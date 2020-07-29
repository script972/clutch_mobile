import 'package:clutch/core/custom_route.dart';
import 'package:clutch/presentation/bloc/profile_bloc.dart';
import 'package:clutch/presentation/event/profile_event.dart';
import 'package:clutch/ui/localization/keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/global.dart';

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
              BlocProvider.of<ProfileBloc>(context)
                  .add(LoadProfile());
              Navigator.pushNamed(context, CustomRoute.PROFILE);
            },
          ),
        ],
      ));
}
