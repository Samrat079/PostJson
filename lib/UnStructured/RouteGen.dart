import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Models/Posts/Post.dart';
import 'package:untitled/Models/User/User.dart';
import 'package:untitled/Models/UserPost/UserPost.dart';
import 'package:untitled/Services/AuthServices/AuthServices.dart';
import 'package:untitled/Services/UserServices/UserServices.dart';
import 'package:untitled/screens/ErrorPage/ErrorPage.dart';
import 'package:untitled/screens/HomePage/Home.dart';
import 'package:untitled/screens/LoginPage/LoginPage.dart';
import 'package:untitled/screens/LoginPage/LoginPage02.dart';
import 'package:untitled/screens/PostPage/PostPage.dart';
import 'package:untitled/screens/Profile/ProfilePage.dart';
import 'package:untitled/screens/TestCredentialsPage/TestCredentials.dart';

class RouteGen {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    final name = settings.name;
    final isLoggedIn = AuthServices().isLoggedIn;

    switch (name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Home());
      case '/test_cred':
        return MaterialPageRoute(builder: (_) => TestCredentials());
      case '/Profile':
        {
          if (!isLoggedIn) {
            return MaterialPageRoute(builder: (_) => LoginPage02());
          }
          if (args is int) {
            return MaterialPageRoute(builder: (_) => ProfilePage(args: args));
          }
          return MaterialPageRoute(
            builder: (_) => ProfilePage(args: AuthServices().userId!),
          );
        }
      case '/Post':
        {
          if (!isLoggedIn) {
            return MaterialPageRoute(builder: (_) => LoginPage02());
          }
          if (args is UserPost) {
            return MaterialPageRoute(builder: (_) => PostPage(post: args));
          }
        }
      default:
        return MaterialPageRoute(builder: (_) => ErrorPage());
    }
    return MaterialPageRoute(builder: (_) => ErrorPage());
  }
}
