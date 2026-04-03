import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:post_json/Models/UserPost/UserPost.dart';
import 'package:post_json/Services/UserPostServices/UserPostService.dart';
import 'package:post_json/UnStructured/Widget/LoadingWidget.dart';
import 'package:post_json/screens/HomePage/Widget/PostCard.dart';
import 'package:post_json/screens/HomePage/Widget/PostFooter.dart';
import 'package:post_json/screens/HomePage/Widget/PostTop.dart';
import 'package:post_json/screens/HomePage/Widget/TagsRow.dart';
import 'package:post_json/screens/HomePage/Widget/TitleAndBody.dart';

import '../../../Models/Posts/Post.dart';
import '../../../Services/PostsServices/PostsServices.dart';

class PostsFutureBuilder extends StatelessWidget {
  final Future<List<UserPost>> getPost;

  const PostsFutureBuilder({super.key, required this.getPost});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UserPost>>(
      future: getPost,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingWidget();
        }
        if (snapshot.hasError) return Text("Error: ${snapshot.error}");
        if (!snapshot.hasData || snapshot.data!.isEmpty) return Text("No data");
        final posts = snapshot.data!;

        return ListView.separated(
          shrinkWrap: true,
          itemCount: posts.length,
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
          itemBuilder: (context, index) {
            final post = posts[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),

              // Not sure weather to put inkwell on the card or here
              // Decided to keep it here so that the card is only ui
              child: InkWell(
                child: PostCard(post: post),
                onTap: () => Navigator.pushNamed(context, "/Post", arguments: post),
              ),
            );
          },
        );
      },
    );
  }
}
