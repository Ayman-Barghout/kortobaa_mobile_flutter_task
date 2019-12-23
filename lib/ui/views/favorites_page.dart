import 'package:flutter/material.dart';
import 'package:kortobaa_mobile_flutter_task/core/services/localization/app_localizations.dart';
import 'package:kortobaa_mobile_flutter_task/ui/shared/text_styles.dart'
    as textStyles;

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          localizations.translate('favorites'),
          style: textStyles.appbarTitleStyle,
        ),
      ),
    );
  }
}
