import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Models/Comments/Comment.dart';
import 'package:untitled/Models/User/User.dart';
import 'package:untitled/Services/UserServices/UserServices.dart';

class CommentsTile extends StatelessWidget {
  final Comment comment;

  const CommentsTile({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      titleAlignment: ListTileTitleAlignment.top,
      leading: CircleAvatar(
        radius: 18,
        backgroundColor: Colors.grey,
        child: Text(
          comment.user.username[0],
          style: TextStyle(color: Colors.white),
        ),
      ),
      title: Text("@${comment.user.username}"),
      subtitle: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(comment.body),
          Row(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.thumb_up_alt_outlined, size: 18),
              Text(comment.likes.toString()),
              Icon(Icons.thumb_down_alt_outlined, size: 18),
            ],
          ),
        ],
      ),
    );
  }
}
