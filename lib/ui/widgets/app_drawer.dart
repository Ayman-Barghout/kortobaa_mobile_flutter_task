import 'package:flutter/material.dart';
import 'package:kortobaa_mobile_flutter_task/core/models/user.dart';
import 'package:kortobaa_mobile_flutter_task/core/services/localization/app_localizations.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key, @required this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context);
    return ListView(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(user.profilePictureUri),
          ),
          title: Text(user.userName),
          subtitle: Text(user.email),
        ),
        Divider(
          color: Theme.of(context).accentColor,
          thickness: 2,
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text(
            localizations.translate('homepage'),
          ),
        ),
        ListTile(
          leading: Icon(Icons.edit),
          title: Text(
            localizations.translate('edit_info'),
          ),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text(
            localizations.translate('settings'),
          ),
        ),
        ListTile(
          leading: Icon(Icons.favorite),
          title: Text(
            localizations.translate('favorites'),
          ),
        ),
      ],
    );
  }
}
