import 'package:clutch/core/custom_route.dart';
import 'package:clutch/helpers/navigation_service.dart';
import 'package:clutch/presentation/bloc/auth_bloc.dart';
import 'package:clutch/presentation/bloc/company_details_bloc.dart';
import 'package:clutch/presentation/bloc/email_verification_bloc.dart';
import 'package:clutch/presentation/bloc/email_verified_code_bloc.dart';
import 'package:clutch/presentation/bloc/invite_code_bloc.dart';
import 'package:clutch/presentation/bloc/main_bloc.dart';
import 'package:clutch/presentation/bloc/offer_details_bloc.dart';
import 'package:clutch/presentation/bloc/profile_bloc.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/localization_provider.dart';
import 'package:flutter_translate/localized_app.dart';
import 'package:get_it/get_it.dart';

// ignore: must_be_immutable
class Application extends StatelessWidget {
  FirebaseAnalytics analytics = FirebaseAnalytics();

  String screen;

  final bool debugMode;

  Application(this.debugMode);

  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;
    final theme = ThemeData(
      fontFamily: 'GoogleSans',
      primaryColor: Color(0xFF02AD58),
      dividerColor: Colors.black,
    );

    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<MainBloc>(
            create: (context) => MainBloc(),
          ),
          BlocProvider<EmailVerificationBloc>(
            create: (context) => EmailVerificationBloc(),
          ),
          BlocProvider<ProfileBloc>(
            create: (context) => ProfileBloc(),
          ),
          BlocProvider<CompanyDetailsBloc>(
            create: (context) => CompanyDetailsBloc(),
          ),
          BlocProvider<OfferDetailsBloc>(
            create: (context) => OfferDetailsBloc(),
          ),
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(),
          ),
          BlocProvider<InviteCodeBloc>(
            create: (context) => InviteCodeBloc(),
          ),
          BlocProvider<EmailVerifiedCodeBloc>(
            create: (context) => EmailVerifiedCodeBloc(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: debugMode,
          theme: theme,
          darkTheme: theme,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            localizationDelegate
          ],
          navigatorKey: GetIt.instance<NavigationService>().navigatorKey,
          supportedLocales: localizationDelegate.supportedLocales,
          locale: localizationDelegate.currentLocale,
          onGenerateRoute: CustomRoute.generateRoute,
          navigatorObservers: [
            FirebaseAnalyticsObserver(analytics: analytics),
          ],
          initialRoute: CustomRoute.SPLASH_SCREEN,
        ),
      ),
    );
  }
}
