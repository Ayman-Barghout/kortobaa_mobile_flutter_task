import 'dart:convert';
import 'package:kortobaa_mobile_flutter_task/core/models/post.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesRepository {
  SharedPreferences sharedPreferences;
  FavoritesRepository({this.sharedPreferences});

  Future<void> addFavorite(Post post) async {
    List<String> favoritesString = sharedPreferences.getStringList('favorites');

    print(favoritesString);
    if (favoritesString == null) {
      await sharedPreferences.setStringList(
          'favorites', [post.id].map((value) => value.toString()).toList());
    } else {
      List<int> favoritesId = favoritesString.map((s) => int.parse(s)).toList();
      await sharedPreferences.setStringList(
          'favorites', favoritesId.map((n) => n.toString()).toList());
    }
  }

  List<Post> fetchFavorites() {
    List<String> favoritesString = sharedPreferences.getStringList('favorites');
    List<String> postsString = sharedPreferences.getStringList('posts');

    if (favoritesString == null || postsString == null) {
      return [];
    } else {
      List<int> favoritesId = favoritesString.map((s) => int.parse(s)).toList();
      List<Post> posts;
      if (postsString != null) {
        posts = postsString
            .map((postJson) => Post.fromJson(json.decode(postJson)))
            .toList();
      } else {
        posts = <Post>[
          Post(
            1,
            "عنوان المقالة 1",
            "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى. ",
            "assets/images/post_1.png",
          ),
          Post(
            2,
            "عنوان المقالة 2",
            "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى. ",
            "assets/images/post_2.png",
          ),
        ];
      }

      return posts.where((post) => favoritesId.contains(favoritesId)).toList();
    }
  }

  Future<void> removeFromFavorites(Post post) async {
    List<String> favoritesString = sharedPreferences.getStringList('favorites');

    if (favoritesString != null) {
      List<int> favoritesId = favoritesString.map((s) => int.parse(s)).toList();
      favoritesId.removeWhere((n) => n == post.id);
      await sharedPreferences.setStringList(
          'favorites', favoritesId.map((n) => n.toString()).toList());
    }
  }
}
