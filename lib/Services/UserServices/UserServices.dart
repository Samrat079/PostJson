import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/Models/User/User.dart';
import 'package:untitled/Services/AuthServices/AuthServices.dart';

class UserServices {
  static final UserServices _instance = UserServices._internal();

  factory UserServices() => _instance;

  UserServices._internal();

  User? _user;
  final String _baseUrl = 'https://dummyjson.com/user';

  Map<String, String> get headers {
    final token = AuthServices().token;
    return {
      "Content-Type": "application/json",
      if (token != null) "Authorization": "Bearer $token",
      "Authorization": "Bearer $token",
    };
  }

  Future<dynamic> _fetcher(String endpoint) async {
    final res = await http.get(
      Uri.parse(_baseUrl + endpoint),
      headers: headers,
    );
    if (res.statusCode != 200) throw Exception("error: ${res.statusCode}");
    return jsonDecode(res.body);
  }

  Future<List<User>> allUser() async {
    final data = await _fetcher("?limit=0");
    final users = List<User>.from(data['users'].map((e) => User.fromJson(e)));
    users.shuffle(Random(2));
    return users;
  }

  Future<User?> currUser() async {
    final data = await _fetcher("/me");
    _user = User.fromJson(data);
    return _user;
  }

  Future<User> userById(int id) async {
    final data = await _fetcher("/$id");
    return User.fromJson(data);
  }

  User get user {
    if (_user == null) throw Exception("Not logged in");
    return _user!;
  }

  set user(User value) {
    _user = value;
  }
}
