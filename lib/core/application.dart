import 'package:clutch/helpers/utils/shared_preferences_helper.dart';
import 'package:clutch/presentation/bloc/main_bloc.dart';
import 'package:clutch/presentation/event/main_event.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:clutch/core/custom_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/localization_provider.dart';
import 'package:flutter_translate/localized_app.dart';

class Application extends StatelessWidget {
  FirebaseAnalytics analytics = FirebaseAnalytics();

  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;
    initBody();
    bool isAuthorize = true;
    final theme = ThemeData(
      fontFamily: "GoogleSans",
      primaryColor: Color(0xFF02AD58),
      dividerColor: Colors.black,
    );

    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<MainBloc>(
            create: (context) => MainBloc()..add(LoadMain()),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: !kReleaseMode,
          theme: theme,
          darkTheme: theme,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            localizationDelegate
          ],
          supportedLocales: localizationDelegate.supportedLocales,
          locale: localizationDelegate.currentLocale,
          onGenerateRoute: CustomRoute.generateRoute,
          navigatorObservers: [
            FirebaseAnalyticsObserver(analytics: analytics),
          ],
          initialRoute:
              isAuthorize ? CustomRoute.MAIN_SCREEN : CustomRoute.SIGN_SCREEN,
        ),
      ),
    );
  }

  void initBody() {
    SharedPreferencesHelper.saveToken(
        "eyJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJDb3Jwb3JhdGthIiwic3ViIjoiMzgwOTM2NjI5NjI3IiwiYXVkIjoid2ViIiwiaWF0IjoxNTg4NDM2NDE4LCJleHAiOjE1ODk0MzY0MTd9.81GFdSc6Qc5AqDqCdhZ2HXbcD54b3JamDe6Yn8FWvG-CN2viRZ6BcRwYFO7MOvuIcRy14hQIAjaq_Fk6GrZgDQ");
  }
}
