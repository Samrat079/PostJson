import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Services/CommentsServices/CommentsServices.dart';
import 'package:untitled/UnStructured/Widget/LoadingWidget.dart';
import 'package:untitled/screens/PostPage/Widget/CommentsTile.dart';

import '../../../Models/Posts/Post.dart';

class CommentsBuilder extends StatelessWidget {
  final Post post;

  const CommentsBuilder({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CommentsServices().getByPostId(post.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingWidget();
        }
        if (snapshot.hasError) return Text("Error: ${snapshot.error}");
        if (!snapshot.hasData || snapshot.data!.isEmpty) return Center(child: Text("No comments yet"));
        final comments = snapshot.data!;
        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: comments.length,
          itemBuilder: (context, index) {
            final comment = comments[index];
            return CommentsTile(comment: comment);
          },
        );
      },
    );
  }
}
