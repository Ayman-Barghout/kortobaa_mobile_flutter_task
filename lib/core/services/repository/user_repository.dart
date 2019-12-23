import 'dart:convert';
import 'package:kortobaa_mobile_flutter_task/core/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  SharedPreferences sharedPreferences;
  UserRepository({this.sharedPreferences});

  Future<void> updateUser(
      User oldUser, String name, String email, String imageUri) async {
    User user = User(name ?? oldUser.userName, email ?? oldUser.email,
        imageUri ?? oldUser.profilePictureUri);
    Map<String, dynamic> userMap = user.toJson();
    String userString = json.encode(userMap);
    await sharedPreferences.setString('user', userString);
  }

  User fetchUser() {
    String userString = sharedPreferences.getString('user');
    if (userString == null) {
      return User(
          "اسم المستخدم", "User99@gmail.com", "assets/images/profile_pic.png");
    } else {
      var userJson = json.decode(userString);
      return User.fromJson(userJson);
    }
  }
}
