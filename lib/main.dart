import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kortobaa_mobile_flutter_task/core/services/localization/app_localizations.dart';
import 'package:kortobaa_mobile_flutter_task/ui/views/home_page.dart';

void main() => runApp(
      // DevicePreview(
      // builder: (context) =>
      KortobaaApp(),
      // ),
    );

class KortobaaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xffb2dfdb),
        accentColor: Color(0xff39796b),
        textTheme: GoogleFonts.almaraiTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      // Device Preview config
      // TODO: remove after getting ready for delivery
      // locale: DevicePreview.of(context).locale,
      // builder: DevicePreview.appBuilder,
      // Localization setup
      supportedLocales: [
        Locale('ar', 'EG'),
        Locale('en', 'US'),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      // Returns a locale which will be used by the app
      localeResolutionCallback: (locale, supportedLocales) {
        // Check if the current device locale is supported
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        // If the locale of the device is not supported, use the first one
        // from the list (Arabic, in this case).
        return supportedLocales.first;
      },
      home: HomePage(),
    );
  }
}
