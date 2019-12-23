import 'package:kortobaa_mobile_flutter_task/core/models/post.dart';

class PostsRepository {
  static List<Post> fetchPosts() {
    return <Post>[
      Post(
          1,
          1,
          "assets/images/post_1.png",
          "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى. ",
          "عنوان المقالة 1",
          false),
      Post(
          2,
          2,
          "assets/images/post_2.png",
          "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى. ",
          "عنوان المقالة 2",
          false),
    ];
  }
}
