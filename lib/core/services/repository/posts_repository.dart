import 'dart:convert';
import 'package:kortobaa_mobile_flutter_task/core/models/post.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostsRepository {
  SharedPreferences sharedPreferences;
  PostsRepository({this.sharedPreferences});

  Future<void> addPost(int id, String title, String description,
      String imageUri, List<Post> posts) async {
    Post newPost = Post(
      id,
      title ?? "عنوان المقالة $id ",
      description ??
          "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى. ",
      imageUri ?? "assets/images/post_2.png",
    );

    posts.add(newPost);

    List<String> postsString =
        posts.map((post) => json.encode(post.toJson())).toList();
    await sharedPreferences.setStringList('posts', postsString);
  }

  List<Post> fetchPosts() {
    List<String> postsString = sharedPreferences.getStringList('posts');
    if (postsString == null) {
      return <Post>[
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
    } else {
      return postsString
          .map((postJson) => Post.fromJson(json.decode(postJson)))
          .toList();
    }
  }
}
