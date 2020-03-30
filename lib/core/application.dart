import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clutch_mobile/core/custom_route.dart';

class Application extends StatelessWidget {
  FirebaseAnalytics analytics = FirebaseAnalytics();

  @override
  Widget build(BuildContext context) {
    bool isAuthorize = false;
    final theme = ThemeData(
      fontFamily: "GoogleSans",
      primaryColor: Color(0xFF02AD58),
      dividerColor: Colors.black,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: !kReleaseMode,
      theme: theme,
      darkTheme: theme,
      onGenerateRoute: CustomRoute.generateRoute,
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
      initialRoute: isAuthorize ? CustomRoute.MAIN_SCREEN : CustomRoute.SIGN_SCREEN ,
    );
  }
}
