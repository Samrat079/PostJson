import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:post_json/Models/Comments/Comment.dart';
import 'package:post_json/Services/AuthServices/AuthServices.dart';
import 'package:post_json/screens/LoginPage/Exception/LoginException.dart';

class CommentsServices {
  static final CommentsServices _instance = CommentsServices._internal();

  factory CommentsServices() => _instance;

  CommentsServices._internal();

  List<Comment?> comments = [];
  final String _baseUrl = 'https://dummyjson.com/comments';
  final userId = AuthServices().userId;

  Future<dynamic> _fetcher(String endpoint) async {
    final res = await http.get(Uri.parse(_baseUrl + endpoint));
    if (res.statusCode != 200) throw Exception("error");
    return jsonDecode(res.body);
  }

  Future<List<Comment>> getByPostId(int postId) async {
    final data = await _fetcher("/post/$postId");
    return List<Comment>.from(data['comments'].map((e) => Comment.fromJson(e)));
  }

  Future<Comment> addComment(String body, int postId) async {
    final res = await http.post(
      Uri.parse('$_baseUrl/add'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({'body': body, 'postId': postId, 'userId': userId}),
    );
    final data = jsonDecode(res.body);
    return Comment.fromJson(data);
  }
}
