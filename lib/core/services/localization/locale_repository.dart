import 'package:shared_preferences/shared_preferences.dart';

class LocaleRepository {
  SharedPreferences sharedPreferences;
  LocaleRepository({this.sharedPreferences});

  Future<void> updateLocale(String locale) async {
    await sharedPreferences.setString('locale', locale);
  }

  String fetchLocale() {
    String locale = sharedPreferences.getString('locale');

    return locale ?? 'ar';
  }
}
