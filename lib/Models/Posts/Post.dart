import 'package:post_json/Models/Posts/Reactions.dart';

class Post {
  final int id, views, userId;

  final String title, body;
  final List<String> tags;
  final Reactions reactions; // contains int likes and dislikes

  Post({
    required this.id,
    required this.views,
    required this.userId,
    required this.title,
    required this.body,
    required this.tags,
    required this.reactions,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      views: json['views'],
      userId: json['userId'],
      title: json['title'],
      body: json['body'],
      tags: List<String>.from(json['tags']),
      reactions: Reactions.fromJson(json['reactions']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'views': views,
      'userId': userId,
      'title': title,
      'body': body,
      'tags': tags,
      'reactions': reactions,
    };
  }
}
