class Post {
  Post(this.id, this.posterId, this.imageUri, this.description, this.title, this.favorited);

  final int id;
  final int posterId;
  final String imageUri;
  final String description;
  final String title;
  final bool favorited;
}
