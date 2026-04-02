import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Models/Auth/Auth.dart';
import 'package:untitled/Models/UserPost/UserPost.dart';
import 'package:untitled/Services/AuthServices/AuthServices.dart';
import 'package:untitled/screens/ErrorPage/ErrorPage.dart';
import 'package:untitled/screens/HomePage/Home.dart';
import 'package:untitled/screens/LoginPage/LoginPage02.dart';
import 'package:untitled/screens/PostPage/PostPage.dart';
import 'package:untitled/screens/TestCredentialsPage/TestCredentials.dart';
import 'package:untitled/screens/WelcomePage/WelcomePage.dart';

import '../screens/ProfilePage/ProfilePage.dart';

class RouteGen {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    final name = settings.name;
    final isLoggedIn = AuthServices().isLoggedIn;
    final bool isOnboarded = AuthServices().isOnborded;


    switch (name) {
      case '/':
        if (!isOnboarded) {
          return MaterialPageRoute(builder: (_) => WelcomePage());
        }
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
