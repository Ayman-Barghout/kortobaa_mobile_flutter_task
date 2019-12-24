import 'package:flutter/material.dart';
import 'package:kortobaa_mobile_flutter_task/core/providers/favorites_provider.dart';
import 'package:kortobaa_mobile_flutter_task/core/services/localization/app_localizations.dart';
import 'package:kortobaa_mobile_flutter_task/ui/shared/text_styles.dart'
    as textStyles;
import 'package:kortobaa_mobile_flutter_task/ui/widgets/post_item.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context);
    FavoritesProvider favoritesProvider =
        Provider.of<FavoritesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          localizations.translate('favorites'),
          style: textStyles.appbarTitleStyle,
        ),
      ),
      body: favoritesProvider.loading
          ? CircularProgressIndicator()
          // if user hasn't favorited any posts, show a text message
          : favoritesProvider.favorites.length != 0
              ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 8),
                    itemBuilder: (BuildContext context, int index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: PostItem(
                        post: favoritesProvider.favorites[index],
                      ),
                    ),
                    itemCount: favoritesProvider.favorites.length,
                  ),
                )
              : Center(
                  child: Text(localizations.translate('no_favorites'),
                      style: textStyles.cardHeaderStyle),
                ),
    );
  }
}
