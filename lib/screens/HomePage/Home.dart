import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:post_json/Models/Posts/Post.dart';
import 'package:post_json/Services/PostsServices/PostsServices.dart';
import 'package:post_json/Services/UserPostServices/UserPostService.dart';
import 'package:post_json/UnStructured/Theme/GradientContainer01.dart';
import 'package:post_json/screens/HomePage/Widget/PostsFutureBuilder.dart';
import 'package:post_json/screens/HomePage/Widget/SideBar01.dart';
import 'package:post_json/screens/SearchDelegate/SearchDelegatePage.dart';

import '../../Models/UserPost/UserPost.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      drawer: SideBar01(),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () =>
                showSearch(context: context, delegate: SearchDelegatePage()),
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: GradientContainer01(
        child: PostsFutureBuilder(getPost: UserPostService().getAllUserPost()),
      ),
    );
  }
}
