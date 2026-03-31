import '../Posts/Post.dart';
import '../User/User.dart';

class UserPost {
  final Post post;
  final User user;

  UserPost({required this.post, required this.user});

  factory UserPost.fromJson(Map<String, dynamic> json) {
    return UserPost(
      post: Post.fromJson(json['posts']),
      user: User.fromJson(json['users']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'post': post.toJson(), 'user': user.toJson()};
  }
}
