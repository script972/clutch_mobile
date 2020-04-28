import 'package:flutter/material.dart';
import 'package:clutch/ui/localization/keys.dart';
import 'package:flutter_translate/global.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Text(translate(Keys.Profile)),
      ),
      body: bodyContent(context),
    );
  }

  Widget bodyContent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[],
          )
        ],
      ),
    );
  }
}
