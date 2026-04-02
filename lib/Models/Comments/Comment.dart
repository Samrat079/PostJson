import 'package:untitled/Models/Comments/Commentator.dart';

class Comment {
  final int id, postId, likes;
  final String body;
  final Commentator user;

  Comment({
    required this.id,
    required this.postId,
    required this.likes,
    required this.body,
    required this.user,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      postId: json['postId'],
      likes: json['likes'],
      body: json['body'],
      // user: json['user'],
      user: Commentator.fromJson(json['user'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'postId': postId,
      'likes': likes,
      'body': body,
      'user': user.toJson(),
    };
  }
}
