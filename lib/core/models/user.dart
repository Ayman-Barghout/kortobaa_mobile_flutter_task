class User {
  User(this.userName, this.email, this.profilePictureUri);

  final String userName;
  final String email;
  final String profilePictureUri;

  User.fromJson(Map<String, dynamic> map)
      : this.userName = map['user_name'],
        this.email = map['email'],
        this.profilePictureUri = map["picture_uri"];

  Map<String, dynamic> toJson() {
    return {
      'user_name': this.userName,
      'email': this.email,
      'picture_uri': this.profilePictureUri
    };
  }
}
