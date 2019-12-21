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
    double queryHeight = MediaQuery.of(context).size.height;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      child: SingleChildScrollView(
        child: Container(
          height: queryHeight * (isPortrait ? 0.47 : 0.81),
          padding: EdgeInsets.all(8),
          child: Container(
            height: queryHeight * (isPortrait ? 0.45 : 0.75),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: Container(
                      color: appColors.lightPlaceHolderColor,
                      height: queryHeight * (isPortrait ? 0.22 : 0.35),
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
                            style: AppTextStyles.lighterTextStyle,
                          ),
                        ],
                      )),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Theme(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: localizations
                                .translate('write_description'),
                            labelStyle: AppTextStyles.lighterTextStyle,
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
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
                    ],
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
