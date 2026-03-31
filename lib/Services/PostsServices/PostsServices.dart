import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

import '../../Models/Posts/Post.dart';

class PostsServices {
  static final PostsServices _instance = PostsServices._internal();

  factory PostsServices() => _instance;

  PostsServices._internal();

  final String _baseUrl = "https://dummyjson.com/posts";

  Future<dynamic> _fetcher(String endpoint) async {
    final res = await http.get(Uri.parse(_baseUrl + endpoint));
    if (res.statusCode != 200) throw Exception("error");
    return jsonDecode(res.body);
  }

  Future<List<Post>> getPosts() async {
    final data = await _fetcher("");
    return List<Post>.from(data['posts'].map((e) => Post.fromJson(e)));
  }

  Future<List<Post>> getAllPosts() async {
    final data = await _fetcher("?limit=0");
    final posts = List<Post>.from(data['posts'].map((e) => Post.fromJson(e)));
    posts.shuffle(Random(2));
    return posts;
  }

  Future<Post> getPostById(int id) async {
    final data = await _fetcher("/$id");
    return Post.fromJson(data);
  }

  Future<List<Post>> getPostByUserId(int id) async {
    final data = await _fetcher("/user/$id");
    return List<Post>.from(data['posts'].map((e) => Post.fromJson(e)));
  }

  Future<List<Post>> searchPost(String query) async {
    final data = await _fetcher("/search?q=$query");
    return List<Post>.from(data['posts'].map((e) => Post.fromJson(e)));
  }
}
