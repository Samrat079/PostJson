import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Models/Auth/Auth.dart';
import 'package:untitled/Models/User/User.dart';
import 'package:untitled/screens/LoginPage/Exception/LoginException.dart';

class AuthServices {
  static final AuthServices _instance = AuthServices._internal();

  factory AuthServices() => _instance;

  AuthServices._internal();

  Auth? _auth;
  bool _isOnborded = false;
  final String _baseUrl = 'https://dummyjson.com/auth';

  Map<String, String> get headers {
    final token = _auth?.accessToken;
    return {
      "Content-Type": "application/json",
      if (token != null) "Authorization": "Bearer $token",
    };
  }

  Future<dynamic> _fetcher(String endpoint) async {
    final res = await http.get(
      Uri.parse(_baseUrl + endpoint),
      headers: headers,
    );
    final data = jsonDecode(res.body);
    if (res.statusCode != 200) throw Exception("error: ${data.toString()}");
    return data;
  }

  Future<Auth?> login(String username, String password) async {
    String body = jsonEncode({"username": username, "password": password});
    final res = await http.post(
      Uri.parse("$_baseUrl/login"),
      headers: headers,
      body: body,
    );
    final data = jsonDecode(res.body);
    if (res.statusCode != 200) throw LoginException(data['message']);
    _auth = Auth.fromJson(data);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_data', jsonEncode(_auth!.toJson()));
    return _auth;
  }

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('auth_data');
    _isOnborded = prefs.getBool('isOnboarded') ?? false;

    if (jsonString != null) {
      _auth = Auth.fromJson(jsonDecode(jsonString));
    }
  }

  Future<void> logout() async {
    _auth = null;

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_data');
  }

  bool get isLoggedIn => _auth?.accessToken != null;

  Auth get auth => _auth ?? (throw Exception("Not Logged in"));

  int? get userId => _auth?.id;

  set auth(Auth value) {
    _auth = value;
  }

  bool get isOnborded => _isOnborded ?? false;

  Future<void> setOnboarded(bool value) async {
    _isOnborded = value;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isOnboarded', value);
  }

  Future<void> switchOnboarded() async {
    final temp = !_isOnborded;
    _isOnborded = temp;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isOnboarded', temp);
  }

  String? get token => _auth?.accessToken;
}
