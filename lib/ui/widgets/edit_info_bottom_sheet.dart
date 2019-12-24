import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kortobaa_mobile_flutter_task/core/providers/user_provider.dart';
import 'package:kortobaa_mobile_flutter_task/core/services/localization/app_localizations.dart';
import 'package:kortobaa_mobile_flutter_task/ui/shared/text_styles.dart'
    as textStyles;
import 'package:provider/provider.dart';

class EditInfoBottomSheet extends StatefulWidget {
  const EditInfoBottomSheet({Key key}) : super(key: key);

  static void show(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.black.withOpacity(0.47),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        context: context,
        builder: (context) => EditInfoBottomSheet());
  }

  @override
  _EditInfoBottomSheetState createState() => _EditInfoBottomSheetState();
}

class _EditInfoBottomSheetState extends State<EditInfoBottomSheet> {
  TextEditingController _userNameController;
  TextEditingController _emailController;
  bool _textFilled;
  File _image;

  @override
  void initState() {
    _textFilled = false;
    _userNameController = TextEditingController()..addListener(_isFieldChanged);
    _emailController = TextEditingController()..addListener(_isFieldChanged);
    super.initState();
  }

  void _isFieldChanged() {
    final String userNameText = _userNameController.text;
    final String emailText = _emailController.text;
    if (userNameText != '' || emailText != '') {
      setState(() {
        _textFilled = true;
      });
    } else {
      setState(() {
        _textFilled = false;
      });
    }
  }

  void _saveChanges() {
    String userNameFieldText = _userNameController.text;
    String emailFieldText = _emailController.text;
    String userName = userNameFieldText == '' ? null : userNameFieldText;
    String email = emailFieldText == '' ? null : emailFieldText;
    String imageUri = _image == null ? null : _image.absolute.path;
    Provider.of<UserProvider>(context, listen: false)
        .updateUser(userName, email, imageUri);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context);
    return AnimatedPadding(
      curve: Curves.decelerate,
      duration: Duration(milliseconds: 300),
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 32),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        height: MediaQuery.of(context).size.height * 0.6,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                controller: _userNameController,
                decoration: InputDecoration(
                  labelText: localizations.translate('name'),
                ),
              ),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: localizations.translate('email'),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      localizations.translate('profile_picture'),
                    ),
                    RaisedButton.icon(
                      onPressed: () async {
                        var image = await ImagePicker.pickImage(
                            source: ImageSource.gallery);

                        setState(() {
                          _image = image;
                        });
                      },
                      color: Theme.of(context).accentColor,
                      label: Text(
                        localizations.translate('pick_picture'),
                        style: textStyles.tabsTextStyle,
                      ),
                      icon: Icon(
                        Icons.photo_album,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    onPressed: _saveChanges,
                    color: Theme.of(context).accentColor,
                    child: Text(
                      localizations.translate('save'),
                      style: textStyles.tabsTextStyle,
                    ),
                  ),
                  // If user made changes, show a text indicating that he has to click save
                  if (_textFilled || _image != null)
                    Text(
                      localizations.translate('save_changes'),
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}
