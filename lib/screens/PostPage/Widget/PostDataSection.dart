import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Models/UserPost/UserPost.dart';
import 'package:untitled/screens/PostPage/Widget/PostPageTop.dart';

import '../../../Models/Posts/Post.dart';
import '../../HomePage/Widget/PostFooter.dart';

class PostDataSection extends StatelessWidget {
  final UserPost post;

  const PostDataSection({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          // Avatar and username
          // PostPageTop(post: post),

          // Title and body
          Text(
            post.post.title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(post.post.body),

          // Like and dislike
          PostFooter(post: post.post),
        ],
      ),
    );
  }
}
