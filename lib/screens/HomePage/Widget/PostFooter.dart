import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled/Models/Posts/Post.dart';
import 'package:untitled/Models/UserPost/UserPost.dart';
import 'package:untitled/screens/HomePage/Widget/PostLikeAndDislike.dart';
import 'package:untitled/screens/HomePage/Widget/PostViews.dart';

class PostFooter extends StatelessWidget {
  final Post post;

  const PostFooter({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Likes and dislikes
        PostLikeAndDislike(post: post),

        // Views
        PostViews(post: post),
      ],
    );
  }
}
