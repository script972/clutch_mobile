import 'package:flutter/material.dart';

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
          ListTile(title: Text("Title"),),
          ListTile(title: Text("Title1"),),
          ListTile(title: Text("Title2"),),
        ],
      ));
}
