class User {
  User(this.id, this.userName, this.email, this.profilePictureUri);

  final int id;
  final String userName;
  final String email;
  final String profilePictureUri;

  User.fromMap(Map<String, dynamic> map)
      : this.id = map['id'],
        this.userName = map['user_name'],
        this.email = map['email'],
        this.profilePictureUri = map["picture_uri"];

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'user_name': this.userName,
      'email': this.email,
      'picture_uri': this.profilePictureUri
    };
  }
}
