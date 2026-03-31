import 'package:untitled/Models/UserPost/UserPost.dart';
import 'package:untitled/Services/PostsServices/PostsServices.dart';
import 'package:untitled/Services/UserServices/UserServices.dart';

import '../../Models/Posts/Post.dart';
import '../../Models/User/User.dart';

class UserPostService {
  static final UserPostService _instance = UserPostService._internal();

  factory UserPostService() => _instance;

  UserPostService._internal();

  Map<int, User>? _userCache;

  Future<Map<int, User>> _getUserMap() async {
    if (_userCache != null) return _userCache!;
    final users = await UserServices().allUser();
    _userCache = {for (var user in users) user.id: user};
    return _userCache!;
  }

  Future<List<UserPost>> _fetcher(List<Post> posts) async {
    final userMap = await _getUserMap();

    return posts.map((post) {
      final user = userMap[post.userId];
      return UserPost(post: post, user: user!);
    }).toList();
  }

  Future<List<UserPost>> getUserPostById(int id) async {
    final posts = await PostsServices().getPostByUserId(id);
    return _fetcher(posts);
  }

  Future<List<UserPost>> getAllUserPost() async {
    final posts = await PostsServices().getAllPosts();
    return _fetcher(posts);
  }

  Future<List<UserPost>> getPostsByQuery(String query) async {
    final posts = await PostsServices().searchPost(query);
    return _fetcher(posts);
  }
}
