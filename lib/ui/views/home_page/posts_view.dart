import 'package:flutter/material.dart';
import 'package:kortobaa_mobile_flutter_task/core/providers/posts_provider.dart';
import 'package:kortobaa_mobile_flutter_task/ui/widgets/post_item.dart';
import 'package:provider/provider.dart';

class PostsView extends StatelessWidget {
  const PostsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostsProvider postsProvider = Provider.of<PostsProvider>(context);
    return postsProvider.loading
        ? CircularProgressIndicator()
        : Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ListView.builder(
              padding: EdgeInsets.only(top: 8),
              itemBuilder: (BuildContext context, int index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: PostItem(
                  post: postsProvider.posts[index],
                ),
              ),
              itemCount: postsProvider.posts.length,
            ),
          );
  }
}
