import 'package:flutter/cupertino.dart';
import 'package:untitled/Models/Posts/Post.dart';

import '../../../Models/UserPost/UserPost.dart';
import '../../HomePage/Widget/PostFooter.dart';
import '../../HomePage/Widget/TagsRow.dart';
import '../../HomePage/Widget/TitleAndBody.dart';

class ProfilePostCard extends StatelessWidget {
  final Post post;
  const ProfilePostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        // This one dosent needs User avatar

        // Title and body
        TitleAndBody(post: post),

        // Tags
        TagsRow(post: post),

        // Post footer with views and likes
        PostFooter(post: post),
      ],
    );
  }
}
