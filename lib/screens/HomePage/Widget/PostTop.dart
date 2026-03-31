import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Models/Posts/Post.dart';
import 'package:untitled/Models/UserPost/UserPost.dart';
import 'package:untitled/Services/UserServices/UserServices.dart';

import '../../../Models/User/User.dart';
import '../../../UnStructured/Widget/LoadingWidget.dart';

class PostTop extends StatelessWidget {
  final User user;

  const PostTop({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(
    //   future: UserServices().userById(post.userId),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Row(
    //         children: [
    //           CircleAvatar(radius: 16),
    //           SizedBox(width: 8),
    //           Text("Loading..."),
    //         ],
    //       );
    //     }
    //     if (snapshot.hasError) {
    //       return Center(child: Text("Error: ${snapshot.error}"));
    //     }
    //     if (!snapshot.hasData) return Center(child: Text("User not found"));
    //     final user = snapshot.data!;

        return InkWell(
          onTap: () =>
              Navigator.pushNamed(context, "/Profile", arguments: user.id),
          child: Row(
            spacing: 12,
            children: [
              CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(user.image),
              ),
              Text("@${user.username}"),
            ],
          ),
        );
    //   },
    // );
  }
}
