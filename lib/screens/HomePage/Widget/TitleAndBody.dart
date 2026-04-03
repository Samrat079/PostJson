import 'package:flutter/cupertino.dart';
import 'package:post_json/Models/UserPost/UserPost.dart';
import 'package:post_json/screens/HomePage/Widget/TagsRow.dart';

import '../../../Models/Posts/Post.dart';

class TitleAndBody extends StatelessWidget {
  final Post post;

  const TitleAndBody({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          post.title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Text(post.body, maxLines: 2, overflow: TextOverflow.ellipsis),
      ],
    );
  }
}
