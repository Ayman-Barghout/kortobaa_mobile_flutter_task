import 'package:flutter/material.dart';
import 'package:kortobaa_mobile_flutter_task/core/models/post.dart';
import 'package:kortobaa_mobile_flutter_task/ui/widgets/post_item.dart';

class PostsView extends StatelessWidget {
  const PostsView({Key key, @required this.posts}) : super(key: key);

  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView.builder(
        padding: EdgeInsets.only(top: 8),
        itemBuilder: (BuildContext context, int index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: PostItem(
            post: posts[index],
          ),
        ),
        itemCount: posts.length,
      ),
    );
  }
}
