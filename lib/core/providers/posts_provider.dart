import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kortobaa_mobile_flutter_task/core/models/post.dart';
import 'package:kortobaa_mobile_flutter_task/core/services/repository/posts_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostsProvider with ChangeNotifier {
  List<Post> _posts;
  PostsRepository _postsRepository;
  bool _loading;

  List<Post> get posts => _posts;
  bool get loading => _loading;

  set loading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  set posts(List<Post> posts) {
    _posts = posts;
    notifyListeners();
  }

  Future<void> addPost(
    int id,
    String title,
    String description,
    String imageUri,
  ) async {
    await _postsRepository.addPost(id, title, description, imageUri, posts);
    posts = _postsRepository.fetchPosts();
  }

  Future<void> load() async {
    loading = true;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _postsRepository = PostsRepository(sharedPreferences: sharedPreferences);
    _posts = _postsRepository.fetchPosts();
    loading = false;
  }
}
