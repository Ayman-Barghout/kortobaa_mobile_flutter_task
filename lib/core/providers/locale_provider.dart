import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kortobaa_mobile_flutter_task/core/services/localization/locale_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider with ChangeNotifier {
  Locale _locale;
  LocaleRepository _localeRepository;

  Locale get locale => _locale;

  set locale(Locale locale) {
    _locale = locale;
    _localeRepository.updateLocale(locale.languageCode);
    notifyListeners();
  }

  Future<void> initProvider() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _localeRepository = LocaleRepository(sharedPreferences: sharedPreferences);
    _locale = _localeRepository.fetchLocale() == 'ar'
        ? Locale('ar', 'EG')
        : Locale('en', 'US');
  }
}
