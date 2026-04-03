import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:post_json/Models/UserPost/UserPost.dart';

import '../../../Models/Posts/Post.dart';
import '../../../UnStructured/Widget/LoadingWidget.dart';
import 'ProfilePostCard.dart';

class ProfilePostBuilder extends StatelessWidget {
  final Future<List<UserPost>> getPost;
  const ProfilePostBuilder({super.key, required this.getPost});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UserPost>>(
      future: getPost,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingWidget();
        }
        if (snapshot.hasError) return Text("Error: ${snapshot.error}");
        if (!snapshot.hasData || snapshot.data!.isEmpty) return Center(child: Text("You have no posts yet"));
        final posts = snapshot.data!;

        return ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: posts.length,
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
          itemBuilder: (context, index) {
            final post = posts[index];
            return InkWell(
              child: ProfilePostCard(post: post.post),
              onTap: () => Navigator.pushNamed(context, "/Post", arguments: post),
            );
          },
        );
      },
    );
  }
}
