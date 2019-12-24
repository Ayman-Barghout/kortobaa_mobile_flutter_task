import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kortobaa_mobile_flutter_task/core/providers/posts_provider.dart';
import 'package:kortobaa_mobile_flutter_task/core/services/localization/app_localizations.dart';
import 'package:kortobaa_mobile_flutter_task/ui/shared/text_styles.dart'
    as textStyles;
import 'package:kortobaa_mobile_flutter_task/ui/shared/app_colors.dart'
    as appColors;
import 'package:provider/provider.dart';

class NewPostDialog extends StatefulWidget {
  const NewPostDialog({Key key}) : super(key: key);

  @override
  _NewPostDialogState createState() => _NewPostDialogState();
}

class _NewPostDialogState extends State<NewPostDialog> {
  TextEditingController _descriptionController;
  File _image;

  @override
  void initState() {
    _descriptionController = TextEditingController();
    super.initState();
  }

  void _addPost(int id) {
    String descriptionTextField = _descriptionController.text;
    String description =
        descriptionTextField == '' ? null : descriptionTextField;
    String imageUri = _image == null ? null : _image.absolute.path;
    Provider.of<PostsProvider>(context, listen: false)
        .addPost(id, null, description, imageUri);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context);
    double queryHeight = MediaQuery.of(context).size.height;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    PostsProvider postsProvider = Provider.of<PostsProvider>(context);
    // New post ID is last post incremented by one
    int postId = postsProvider.posts.length + 1;

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
            width: MediaQuery.of(context).size.width - (isPortrait ? 16 : 32),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Container(
                height: queryHeight * (isPortrait ? 0.495 : 0.725),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // If no image provider show a placeholder, else show the image provider by user
                    _image == null
                        ? InkWell(
                            onTap: () async {
                              var image = await ImagePicker.pickImage(
                                  source: ImageSource.gallery);

                              setState(() {
                                _image = image;
                              });
                            },
                            child: Container(
                                color: appColors.lightPlaceHolderColor,
                                height:
                                    queryHeight * (isPortrait ? 0.25 : 0.35),
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
                          )
                        : Image.file(
                            File(_image.absolute.path),
                            height: queryHeight * (isPortrait ? 0.25 : 0.35),
                          ),
                    Theme(
                      child: TextField(
                        controller: _descriptionController,
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
                          onPressed: () => _addPost(postId),
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
