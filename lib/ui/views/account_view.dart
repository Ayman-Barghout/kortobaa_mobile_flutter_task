import 'package:flutter/material.dart';
import 'package:kortobaa_mobile_flutter_task/core/services/localization/app_localizations.dart';
import 'package:kortobaa_mobile_flutter_task/ui/shared/app_colors.dart'
    as appColors;
import 'package:kortobaa_mobile_flutter_task/core/models/user.dart';
import 'package:kortobaa_mobile_flutter_task/ui/shared/text_styles.dart';
import 'package:kortobaa_mobile_flutter_task/ui/widgets/round_iconbutton_label.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key key, @required this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    double queryHeight = MediaQuery.of(context).size.height;
    double queryWidth = MediaQuery.of(context).size.width;
    AppLocalizations localizations = AppLocalizations.of(context);
    return Stack(
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
          width: queryWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: queryHeight * 0.23,
              ),
              CircleAvatar(
                radius: queryHeight * 0.1,
                backgroundImage: AssetImage(user.profilePictureUri),
              ),
              SizedBox(
                height: queryHeight * 0.01,
              ),
              Text(
                user.userName,
                style: AppTextStyles.headerStyle,
              ),
              SizedBox(
                height: queryHeight * 0.01,
              ),
              Text(
                user.email,
                style: AppTextStyles.lightTextStyle,
              ),
              SizedBox(
                height: queryHeight * 0.08,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RoundIconButtonWithLabel(
                    iconData: Icons.edit,
                    onPressed: () {},
                    label: localizations.translate('edit_info'),
                  ),
                  RoundIconButtonWithLabel(
                    iconData: Icons.settings,
                    onPressed: () {},
                    label: localizations.translate('settings'),
                  ),
                  RoundIconButtonWithLabel(
                    iconData: Icons.star,
                    onPressed: () {},
                    label: localizations.translate('favorites'),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
