import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kortobaa_mobile_flutter_task/core/providers/user_provider.dart';
import 'package:kortobaa_mobile_flutter_task/core/services/localization/app_localizations.dart';
import 'package:kortobaa_mobile_flutter_task/ui/shared/app_colors.dart'
    as appColors;
import 'package:kortobaa_mobile_flutter_task/core/models/user.dart';
import 'package:kortobaa_mobile_flutter_task/ui/shared/text_styles.dart'
    as textStyles;
import 'package:kortobaa_mobile_flutter_task/ui/views/favorites_page.dart';
import 'package:kortobaa_mobile_flutter_task/ui/views/settings_page.dart';
import 'package:kortobaa_mobile_flutter_task/ui/widgets/edit_info_bottom_sheet.dart';
import 'package:kortobaa_mobile_flutter_task/ui/widgets/round_iconbutton_label.dart';
import 'package:provider/provider.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double queryHeight = MediaQuery.of(context).size.height;
    double queryWidth = MediaQuery.of(context).size.width;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    AppLocalizations localizations = AppLocalizations.of(context);
    User user = Provider.of<UserProvider>(context).user;
    return Scrollbar(
      child: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: queryHeight * 0.35,
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: appColors.boxShadowColor,
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ]),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 20),
              width: queryWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: queryHeight * (isPortrait ? 0.23 : 0.1),
                  ),
                  CircleAvatar(
                    radius: queryHeight * (isPortrait ? 0.1 : 0.2),
                    // Check if user has default profile picture in assets, if not load it from file
                    backgroundImage: user.profilePictureUri ==
                            'assets/images/profile_pic.png'
                        ? AssetImage(user.profilePictureUri)
                        : FileImage(File(user.profilePictureUri)),
                  ),
                  SizedBox(
                    height: queryHeight * 0.01,
                  ),
                  Text(
                    user.userName,
                    style: textStyles.cardHeaderStyle,
                  ),
                  SizedBox(
                    height: queryHeight * 0.01,
                  ),
                  Text(
                    user.email,
                    style: textStyles.lightTextStyle,
                  ),
                  SizedBox(
                    height: queryHeight * 0.08,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RoundIconButtonWithLabel(
                        iconData: Icons.edit,
                        onPressed: () => EditInfoBottomSheet.show(context),
                        label: localizations.translate('edit_info'),
                      ),
                      RoundIconButtonWithLabel(
                        iconData: Icons.settings,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SettingsPage()));
                        },
                        label: localizations.translate('settings'),
                      ),
                      RoundIconButtonWithLabel(
                        iconData: Icons.star,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => FavoritesPage()));
                        },
                        label: localizations.translate('favorites'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
