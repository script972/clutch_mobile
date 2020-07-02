import 'package:clutch/ui/screen/base_screen.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) => BaseScreen(
    child: Scaffold(
        body: Text("123"),
      ),
  );
}
