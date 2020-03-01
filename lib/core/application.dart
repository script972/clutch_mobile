import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clutch_mobile/ui/screen/main_screen.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      fontFamily: "GoogleSans",
      primaryColor: Color(0xFF02AD58),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: !kReleaseMode,
      theme: theme,
      home: MainScreen(),
    );
  }
}
