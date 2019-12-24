import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kortobaa_mobile_flutter_task/core/models/post.dart';
import 'package:kortobaa_mobile_flutter_task/core/services/repository/favorites_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesProvider with ChangeNotifier {
  FavoritesRepository _favoritesRepository;
  List<Post> _favorites;
  List<int> _favoritesId;
  bool _loading;

  bool get loading => _loading;

  set loading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  List<Post> get favorites => _favorites;

  set favorites(List<Post> favorites) {
    _favorites = favorites;
    notifyListeners();
  }

  List<int> get favoritesId => _favoritesId;

  set favoritesId(List<int> favoritesId) {
    _favoritesId = favoritesId;
    notifyListeners();
  }

  Future<void> addFavorite(Post post) async {
    await _favoritesRepository.addFavorite(post);
    favorites = _favoritesRepository.fetchFavorites();
    favoritesId = favorites.map((post) => post.id).toList();
  }

  Future<void> removeFavorite(Post post) async {
    await _favoritesRepository.removeFromFavorites(post);
    favorites = _favoritesRepository.fetchFavorites();
    favoritesId = favorites.map((post) => post.id).toList();
  }

  Future<void> load() async {
    loading = true;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _favoritesRepository =
        FavoritesRepository(sharedPreferences: sharedPreferences);
    favorites = _favoritesRepository.fetchFavorites();
    favoritesId = favorites.map((post) => post.id).toList();

    loading = false;
  }
}
