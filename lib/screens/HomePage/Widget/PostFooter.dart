import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:post_json/Models/Posts/Post.dart';
import 'package:post_json/Models/UserPost/UserPost.dart';
import 'package:post_json/screens/HomePage/Widget/PostLikeAndDislike.dart';
import 'package:post_json/screens/HomePage/Widget/PostViews.dart';

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
