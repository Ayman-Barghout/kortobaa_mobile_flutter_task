import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kortobaa_mobile_flutter_task/core/models/post.dart';
import 'package:kortobaa_mobile_flutter_task/core/providers/favorites_provider.dart';
import 'package:kortobaa_mobile_flutter_task/ui/shared/text_styles.dart'
    as textStyles;
import 'package:kortobaa_mobile_flutter_task/ui/shared/app_colors.dart'
    as appColors;
import 'package:provider/provider.dart';

class PostItem extends StatelessWidget {
  const PostItem({Key key, this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    FavoritesProvider favoritesProvider =
        Provider.of<FavoritesProvider>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Card(
          elevation: 2,
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                          style: textStyles.cardHeaderStyle.copyWith(
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
                            color:
                                favoritesProvider.favoritesId.contains(post.id)
                                    ? Colors.red
                                    : appColors.lightTextColor,
                          ),
                          onPressed: () {
                            print(post.id);
                            print(favoritesProvider.favoritesId
                                .contains(post.id));
                            if (favoritesProvider.favoritesId
                                .contains(post.id)) {
                              favoritesProvider.removeFavorite(post);
                            } else {
                              favoritesProvider.addFavorite(post);
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              post.imageUri == 'assets/images/post_1.png' ||
                      post.imageUri == 'assets/images/post_2.png'
                  ? Image.asset(post.imageUri)
                  : Image.file(File(post.imageUri)),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12.0),
                child: Text(
                  post.description,
                  style: textStyles.cardSubHeaderStyle,
                ),
              )
            ],
          )),
    );
  }
}
