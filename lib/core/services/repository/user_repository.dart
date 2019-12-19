import 'package:kortobaa_mobile_flutter_task/core/models/user.dart';

class UserRepository {
  User getUser() {
    return User(1, "Ayman.a.barghout@gmail.com", "أيمن برغوت",
        "assets/images/profile_pic.png");
  }
}
