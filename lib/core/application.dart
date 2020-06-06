import 'package:clutch/core/custom_route.dart';
import 'package:clutch/helpers/utils/shared_preferences_helper.dart';
import 'package:clutch/presentation/bloc/auth_bloc.dart';
import 'package:clutch/presentation/bloc/company_details_bloc.dart';
import 'package:clutch/presentation/bloc/main_bloc.dart';
import 'package:clutch/presentation/bloc/offer_details_bloc.dart';
import 'package:clutch/presentation/bloc/profile_bloc.dart';
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
            create: (context) => MainBloc() /*..add(LoadMain())*/,
          ),
          BlocProvider<ProfileBloc>(
            create: (context) => ProfileBloc() /*..add(LoadProfile())*/,
          ),
          BlocProvider<CompanyDetailsBloc>(
            create: (context) =>
                CompanyDetailsBloc() /*..add(LoadCompanyDetails(1))*/,
          ),
          BlocProvider<OfferDetailsBloc>(
            create: (context) =>
                OfferDetailsBloc() /*..add(LoadOfferDetails(1))*/,
          ),
          BlocProvider<AuthBloc>(
            create: (context) =>
                AuthBloc() /*..add(LoadOfferDetails(1))*/,
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
          initialRoute: isAuthorize
              ? CustomRoute.MAIN_SCREEN
              : CustomRoute.SIGNIN_PHONE_SCREEN,
        ),
      ),
    );
  }

}
