import 'package:flutter/material.dart';
import 'package:kortobaa_mobile_flutter_task/core/providers/locale_provider.dart';
import 'package:kortobaa_mobile_flutter_task/core/services/localization/app_localizations.dart';
import 'package:kortobaa_mobile_flutter_task/ui/shared/text_styles.dart'
    as textStyles;
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context);
    LocaleProvider localeProvider =
        Provider.of<LocaleProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          localizations.translate('settings'),
          style: textStyles.appbarTitleStyle,
        ),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
              localizations.translate('select_language'),
            ),
            trailing: DropdownButton(
              value: localeProvider.locale == Locale('en', 'US') ? 'en' : 'ar',
              items: <DropdownMenuItem>[
                DropdownMenuItem(
                  child: Text(
                    localizations.translate('arabic'),
                  ),
                  value: 'ar',
                ),
                DropdownMenuItem(
                  child: Text(
                    localizations.translate('english'),
                  ),
                  value: 'en',
                )
              ],
              onChanged: (value) {
                localeProvider.locale =
                    value == 'ar' ? Locale('ar', 'EG') : Locale('en', 'US');
              },
            ),
          ),
        ],
      ),
    );
  }
}
