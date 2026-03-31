import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Models/Posts/Post.dart';
import '../../../Models/User/User.dart';
import '../../../Services/UserServices/UserServices.dart';
import '../../../UnStructured/Widget/LoadingWidget.dart';

class PostPageTop extends StatelessWidget {
  final User user;

  const PostPageTop({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(
    //   future: UserServices().userById(post.userId),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Row(
    //         spacing: 12,
    //         children: [
    //           CircleAvatar(radius: 16, backgroundColor: Colors.grey),
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
