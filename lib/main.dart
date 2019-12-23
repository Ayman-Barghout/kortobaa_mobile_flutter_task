import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kortobaa_mobile_flutter_task/core/providers/locale_provider.dart';
import 'package:kortobaa_mobile_flutter_task/core/providers/user_provider.dart';
import 'package:kortobaa_mobile_flutter_task/core/services/localization/app_localizations.dart';
import 'package:kortobaa_mobile_flutter_task/ui/shared/app_colors.dart'
    as appColors;
import 'package:kortobaa_mobile_flutter_task/ui/views/home_page/home_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleProvider localeProvider = LocaleProvider();
  UserProvider userProvider = UserProvider();
  await localeProvider.initProvider();
  await userProvider.load();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<LocaleProvider>.value(
      value: localeProvider,
    ),
    ChangeNotifierProvider<UserProvider>.value(
      value: userProvider,
    ),
  ], child: KortobaaApp()));
}

class KortobaaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryIconTheme: IconThemeData(color: Colors.white),
        fontFamily: 'Almarai',
        primaryColor: appColors.primaryColor,
        accentColor: appColors.accentColor,
      ),
      supportedLocales: [
        Locale('ar', 'EG'),
        Locale('en', 'US'),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      // Provides the locale, defaults to Arabic if null is found in shared_pref
      locale: Provider.of<LocaleProvider>(context).locale,
      home: HomePage(),
    );
  }
}
