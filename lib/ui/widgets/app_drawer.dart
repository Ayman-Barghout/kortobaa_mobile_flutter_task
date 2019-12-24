import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kortobaa_mobile_flutter_task/core/models/user.dart';
import 'package:kortobaa_mobile_flutter_task/core/providers/user_provider.dart';
import 'package:kortobaa_mobile_flutter_task/core/services/localization/app_localizations.dart';
import 'package:kortobaa_mobile_flutter_task/ui/views/favorites_page.dart';
import 'package:kortobaa_mobile_flutter_task/ui/views/settings_page.dart';
import 'package:kortobaa_mobile_flutter_task/ui/widgets/edit_info_bottom_sheet.dart';
import 'package:kortobaa_mobile_flutter_task/ui/shared/app_colors.dart'
    as appColors;
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context);
    User user = Provider.of<UserProvider>(context).user;
    return ListView(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            // Check if user has default profile picture in assets, if not load it from file
            backgroundImage:
                user.profilePictureUri == 'assets/images/profile_pic.png'
                    ? AssetImage(user.profilePictureUri)
                    : FileImage(File(user.profilePictureUri)),
          ),
          title: Text(user.userName),
          subtitle: Text(user.email),
        ),
        Divider(
          color: appColors.accentColor,
          thickness: 2,
          indent: 10,
        ),
        ListTile(
          leading: Icon(Icons.home, color: appColors.accentColor),
          title: Text(
            localizations.translate('homepage'),
          ),
          onTap: () => Navigator.of(context).pop(),
        ),
        ListTile(
          leading: Icon(Icons.edit, color: appColors.accentColor),
          title: Text(
            localizations.translate('edit_info'),
          ),
          onTap: () {
            Navigator.of(context).pop();
            EditInfoBottomSheet.show(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.settings, color: appColors.accentColor),
          title: Text(
            localizations.translate('settings'),
          ),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SettingsPage(),
            ));
          },
        ),
        ListTile(
          leading: Icon(Icons.favorite, color: appColors.accentColor),
          title: Text(
            localizations.translate('favorites'),
          ),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => FavoritesPage(),
            ));
          },
        ),
      ],
    );
  }
}
