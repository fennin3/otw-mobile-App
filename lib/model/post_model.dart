import 'dart:typed_data';

class Post {
  final String postIdApi;
  final String userId;
  final String categoryName;
  final String categoryId;
  final String weekNo;
  final String rating;
  final Uint8List picture;
  final String dbId;

  Post({
    this.rating,
    this.categoryId,
    this.categoryName,
    this.picture,
    this.userId,
    this.weekNo,
    this.postIdApi,
    this.dbId,
  });
}
