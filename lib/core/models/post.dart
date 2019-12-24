class Post {
  Post(
    this.id,
    this.title,
    this.description,
    this.imageUri,
  );

  final int id;
  final String title;
  final String description;
  final String imageUri;

  Post.fromJson(Map<String, dynamic> map)
      : this.id = map['id'],
        this.title = map['title'],
        this.description = map['description'],
        this.imageUri = map['imageUri'];

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'title': this.title,
      'description': this.description,
      'imageUri': this.imageUri,
    };
  }
}
