import 'package:flutter/material.dart';
import 'package:kortobaa_mobile_flutter_task/core/models/post.dart';
import 'package:kortobaa_mobile_flutter_task/ui/shared/text_styles.dart';
import 'package:kortobaa_mobile_flutter_task/ui/shared/app_colors.dart'
    as appColors;

class PostItem extends StatelessWidget {
  const PostItem({Key key, this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: appColors.placeHolderColor,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        post.title,
                        style: AppTextStyles.headerStyle.copyWith(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.share,
                          color: appColors.lightTextColor,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.bookmark,
                          color: appColors.lightTextColor,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: appColors.lightTextColor,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Image.asset(post.imageUri),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Text(
                post.description,
                style: AppTextStyles.subHeaderStyle,
              ),
            )
          ],
        ));
  }
}