import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Models/Posts/Post.dart';

class PostLikeAndDislike extends StatelessWidget {
  final Post post;
  const PostLikeAndDislike({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(90),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IntrinsicHeight(
          child: Row(
            spacing: 6,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.thumb_up_outlined, size: 18),
              Text(post.reactions.likes.toString()),
              VerticalDivider(thickness: 1),
              Icon(Icons.thumb_down_outlined, size: 18),
              Text(post.reactions.dislikes.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
