import 'package:clutch/core/custom_route.dart';
import 'package:clutch/helpers/utils/shared_preferences_helper.dart';
import 'package:clutch/presentation/bloc/company_details_bloc.dart';
import 'package:clutch/presentation/bloc/main_bloc.dart';
import 'package:clutch/presentation/bloc/offer_details_bloc.dart';
import 'package:clutch/presentation/bloc/profile_bloc.dart';
import 'package:clutch/presentation/event/company_details_event.dart';
import 'package:clutch/presentation/event/main_event.dart';
import 'package:clutch/presentation/event/offer_details_event.dart';
import 'package:clutch/presentation/event/profile_event.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
    bool isAuthorize = false;
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
          ),
          BlocProvider<ProfileBloc>(
            create: (context) => ProfileBloc()..add(LoadProfile()),
          ),
          BlocProvider<CompanyDetailsBloc>(
            create: (context) =>
                CompanyDetailsBloc()..add(LoadCompanyDetails(1)),
          ),
          BlocProvider<OfferDetailsBloc>(
            create: (context) => OfferDetailsBloc()..add(LoadOfferDetails(1)),
          ),
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
              isAuthorize ? CustomRoute.MAIN_SCREEN : CustomRoute.SIGNIN_PHONE_SCREEN,
        ),
      ),
    );
  }

  void initBody() {
    SharedPreferencesHelper.saveToken(
        "eyJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJDb3Jwb3JhdGthIiwic3ViIjoiMzgwOTM2NjI5NjI3IiwiYXVkIjoid2ViIiwiaWF0IjoxNTg5NjM2OTA4LCJleHAiOjE1OTA2MzY5MDd9.mIbK_wWJwxxjcUIYMFss9b27pWFdxMM92xDeE58Y_DU5vycF9wW_fyvwPM7dKKpdy8TKtubmM9hB2ar1NSp9LA");
  }
}
