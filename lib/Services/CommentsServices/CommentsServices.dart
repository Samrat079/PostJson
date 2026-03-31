import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled/Models/Comments/Comment.dart';

class CommentsServices {
  static final CommentsServices _instance = CommentsServices._internal();

  factory CommentsServices() => _instance;

  CommentsServices._internal();

  List<Comment?> comments = [];
  final String _baseUrl = 'https://dummyjson.com/comments';

  Future<dynamic> _fetcher(String endpoint) async {
    final res = await http.get(Uri.parse(_baseUrl + endpoint));
    if (res.statusCode != 200) throw Exception("error");
    return jsonDecode(res.body);
  }

  Future<List<Comment>> getByPostId(int postId) async {
    final data = await _fetcher("/post/$postId");
    return List<Comment>.from(data['comments'].map((e) => Comment.fromJson(e)));
  }
}
