import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kortobaa_mobile_flutter_task/core/models/user.dart';
import 'package:kortobaa_mobile_flutter_task/core/services/repository/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  User _user;
  UserRepository _userRepository;

  User get user => _user;

  set user(User user) {
    _user = user;
    notifyListeners();
  }

  void updateUser(String userName, String email, String imageUri) async {
    await _userRepository.updateUser(_user, userName, email, imageUri);
    user = _userRepository.fetchUser();
  }

  Future<void> load() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _userRepository = UserRepository(sharedPreferences: sharedPreferences);
    _user = _userRepository.fetchUser();
  }
}
