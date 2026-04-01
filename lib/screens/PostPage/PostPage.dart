import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Models/UserPost/UserPost.dart';
import 'package:untitled/UnStructured/Theme/GradientContainer01.dart';
import 'package:untitled/screens/HomePage/Widget/PostCard.dart';
import 'package:untitled/screens/HomePage/Widget/PostFooter.dart';
import 'package:untitled/screens/PostPage/Widget/CommentsBuilder.dart';
import 'package:untitled/screens/PostPage/Widget/PostDataSection.dart';
import 'package:untitled/screens/PostPage/Widget/PostPageTop.dart';

import '../../Models/Posts/Post.dart';
import '../../Models/User/User.dart';

class PostPage extends StatelessWidget {
  final UserPost post;

  // final User user;

  const PostPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: PostPageTop(user: post.user)),
      body: GradientContainer01(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///////////////////      Post data part     ///////////////////////////////
            PostDataSection(post: post),
        
            // Divider
            Divider(),
        
            /////////////////     Comments part     ///////////////////////////
            CommentsBuilder(post: post.post),
          ],
        ),
      ),
    );
  }
}
