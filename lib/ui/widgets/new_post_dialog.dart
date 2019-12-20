import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kortobaa_mobile_flutter_task/core/services/localization/app_localizations.dart';
import 'package:kortobaa_mobile_flutter_task/ui/shared/text_styles.dart';
import 'package:kortobaa_mobile_flutter_task/ui/shared/app_colors.dart'
    as appColors;

class NewPostDialog extends StatelessWidget {
  const NewPostDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context);
    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets +
          const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              InkWell(
                onTap: () {},
                child: Container(
                    color: appColors.lightPlaceHolderColor,
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.camera_alt,
                          color: appColors.lighterTextColor,
                          size: MediaQuery.of(context).size.width * 0.18,
                        ),
                        Text(
                          'Upload photo',
                          style: AppTextStyles.lighterTextStyle,
                        ),
                      ],
                    )),
              ),
              Flexible(
                child: FractionallySizedBox(
                  heightFactor: 0.5,
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      localizations.translate('write_description'),
                      style: AppTextStyles.lighterTextStyle,
                    ),
                    Theme(
                      child: TextField(
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLength: 120,
                        maxLines: 2,
                        inputFormatters: <TextInputFormatter>[
                          LengthLimitingTextInputFormatter(120),
                        ],
                      ),
                      data: Theme.of(context).copyWith(
                          primaryColor: Theme.of(context).accentColor),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: FractionallySizedBox(
                  heightFactor: 1.5,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    child: Text(
                      localizations.translate('discard'),
                      style: AppTextStyles.dismissButtonStyle,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  RaisedButton(
                    color: Theme.of(context).accentColor,
                    child: Text(
                      localizations.translate('post'),
                      style: AppTextStyles.navigationTextStyle,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
