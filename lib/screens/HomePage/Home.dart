import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Models/Posts/Post.dart';
import 'package:untitled/Services/PostsServices/PostsServices.dart';
import 'package:untitled/Services/UserPostServices/UserPostService.dart';
import 'package:untitled/screens/HomePage/Widget/PostsFutureBuilder.dart';
import 'package:untitled/screens/HomePage/Widget/SideBar01.dart';
import 'package:untitled/screens/Profile/ProfilePage.dart';
import 'package:untitled/screens/SearchDelegate/SearchDelegatePage.dart';

import '../../Models/UserPost/UserPost.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: PostsFutureBuilder(getPost: UserPostService().getAllUserPost()),
    );
  }
}
