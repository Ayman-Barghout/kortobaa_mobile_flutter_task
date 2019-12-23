import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kortobaa_mobile_flutter_task/core/services/localization/app_localizations.dart';
import 'package:kortobaa_mobile_flutter_task/ui/shared/text_styles.dart'
    as textStyles;
import 'package:kortobaa_mobile_flutter_task/ui/shared/app_colors.dart'
    as appColors;

class NewPostDialog extends StatelessWidget {
  const NewPostDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context);
    double queryHeight = MediaQuery.of(context).size.height;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Material(
      color: Colors.black.withOpacity(0.47),
      // AnimatedPadding to fix keyboard covering textfield issues
      child: AnimatedPadding(
        curve: Curves.decelerate,
        duration: Duration(milliseconds: 300),
        padding: MediaQuery.of(context).viewInsets,
        child: Center(
          child: Container(
            padding: EdgeInsets.all(8),
            height: queryHeight * (isPortrait ? 0.52 : 0.75),
            width: MediaQuery.of(context).size.width - 16,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Container(
                height: queryHeight * (isPortrait ? 0.495 : 0.71),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: () {},
                      child: Container(
                          color: appColors.lightPlaceHolderColor,
                          height: queryHeight * (isPortrait ? 0.25 : 0.35),
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.camera_alt,
                                color: appColors.lighterTextColor,
                                size: MediaQuery.of(context).size.width *
                                    (isPortrait ? 0.18 : 0.1),
                              ),
                              Text(
                                'Upload photo',
                                style: textStyles.labelStyle,
                              ),
                            ],
                          )),
                    ),
                    Theme(
                      child: TextField(
                        decoration: InputDecoration(
                            labelText:
                                localizations.translate('write_description'),
                            labelStyle: textStyles.labelStyle),
                        keyboardType: TextInputType.multiline,
                        maxLength: 120,
                        maxLines: queryHeight < 840 ? 2 : 4,
                        inputFormatters: <TextInputFormatter>[
                          LengthLimitingTextInputFormatter(120),
                        ],
                      ),
                      data: Theme.of(context).copyWith(
                          primaryColor: Theme.of(context).accentColor),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          child: Text(
                            localizations.translate('discard'),
                            style: textStyles.discardButtonTextStyle,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        RaisedButton(
                          color: Theme.of(context).accentColor,
                          child: Text(
                            localizations.translate('post'),
                            style: textStyles.tabsTextStyle,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
