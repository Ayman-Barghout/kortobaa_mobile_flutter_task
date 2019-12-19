import 'package:kortobaa_mobile_flutter_task/core/models/user.dart';

class UserRepository {
  static User getUser() {
    return User(1, "أيمن برغوت", "Ayman.a.barghout@gmail.com",
        "assets/images/profile_pic.png");
  }
}
