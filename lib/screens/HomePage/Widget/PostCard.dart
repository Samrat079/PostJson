import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:post_json/Models/UserPost/UserPost.dart';

import '../../../Models/Posts/Post.dart';
import 'PostFooter.dart';
import 'PostTop.dart';
import 'TagsRow.dart';
import 'TitleAndBody.dart';

class PostCard extends StatelessWidget {
  final UserPost post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Top with username and avatar
        PostTop(user: post.user),

        // Title and body
        TitleAndBody(post: post.post),

        // Tags
        TagsRow(post: post.post),

        // Post footer with views and likes
        PostFooter(post: post.post),
      ],
    );
  }
}
