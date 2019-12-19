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
    return Container(
        child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.share,
                    color: appColors.placeHolderColor,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.bookmark,
                    color: appColors.placeHolderColor,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: appColors.placeHolderColor,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: appColors.placeHolderColor,
                ),
                Text(
                  post.title,
                  style: AppTextStyles.headerStyle.copyWith(
                    fontSize: 14,
                  ),
                ),
              ],
            )
          ],
        ),
        Image.asset(post.imageUri),
        Text(
          post.description,
          style: AppTextStyles.subHeaderStyle,
        )
      ],
    ));
  }
}
