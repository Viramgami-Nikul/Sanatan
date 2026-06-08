import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:santvani_app/routes/routes_name.dart';

import 'package:santvani_app/bloc/my_app/localisation_bloc.dart';

import 'package:santvani_app/routes/app_routes.dart';

import 'package:santvani_app/theme/app_colors.dart';

import 'package:santvani_app/theme/app_theme.dart';

import 'package:santvani_app/utils/app_enums.dart';

import 'package:santvani_app/utils/flavors.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<LocalisationBloc, LocalisationState>(
      builder: (final BuildContext context, final LocalisationState state) {
        return MaterialApp(

          debugShowCheckedModeBanner: FlavorConfig.isStaging,

          title: FlavorConfig.title,
          navigatorKey: navigatorKey,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.light,
          initialRoute: RouteName.splashScreen,
          routes: AppRoutes.getRoutes(),

          localizationsDelegates: const <LocalizationsDelegate<Object>>[
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],

          locale: context.watch<LocalisationBloc>().state.language,

          supportedLocales: <Locale>[
            Locale(
              SupportedLangCode.english.langCode,
              SupportedLangCode.english.countryCode,
            ),

            Locale(
              SupportedLangCode.gujarati.langCode,
              SupportedLangCode.gujarati.countryCode,
            ),
          ],

          localeResolutionCallback:
              (final Locale? locale, final Iterable<Locale> supportedLocales) {
                for (final Locale supportedLocale in supportedLocales) {
                  if (supportedLocale.languageCode == locale?.languageCode) {
                    return supportedLocale;
                  }
                }

                return supportedLocales.first;
              },

          builder: (final BuildContext context, final Widget? child) {
            return MediaQuery(
              data: MediaQuery.of(
                context,
              ).copyWith(textScaler: const TextScaler.linear(1.0)),
              child: child!,
            );
          },
        );
      },
    );
  }
}
