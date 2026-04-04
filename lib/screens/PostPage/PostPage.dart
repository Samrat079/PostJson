import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:post_json/Models/UserPost/UserPost.dart';
import 'package:post_json/UnStructured/Theme/GradientContainer01.dart';
import 'package:post_json/screens/HomePage/Widget/PostCard.dart';
import 'package:post_json/screens/HomePage/Widget/PostFooter.dart';
import 'package:post_json/screens/PostPage/Widget/CommentTextField01.dart';
import 'package:post_json/screens/PostPage/Widget/CommentsBuilder.dart';
import 'package:post_json/screens/PostPage/Widget/CommentsTile.dart';
import 'package:post_json/screens/PostPage/Widget/PostDataSection.dart';
import 'package:post_json/screens/PostPage/Widget/PostPageTop.dart';

import '../../Models/Comments/Comment.dart';

class PostPage extends StatefulWidget {
  final UserPost post;

  const PostPage({super.key, required this.post});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final List<Comment> newComments = [];

  void addComment(Comment c) {
    setState(() {
      newComments.insert(0, c);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: PostPageTop(user: widget.post.user)),
      body: GradientContainer01(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///////////////////      Post data part     ///////////////////////////////
            PostDataSection(post: widget.post),

            // Divider
            Divider(),

            /////////////////     Comments part     ///////////////////////////
            CommentsBuilder(post: widget.post.post),

            ...newComments.map((comm) => CommentsTile(comment: comm)),
          ],
        ),
      ),
      bottomNavigationBar: CommentTextField01(
        postId: widget.post.post.id,
        onCommentAdded: addComment,
      ),
    );
  }
}
