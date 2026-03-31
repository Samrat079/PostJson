import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Models/UserPost/UserPost.dart';

import '../../../Models/Posts/Post.dart';

class SuggestionTile extends StatelessWidget {
  final UserPost userPost;

  const SuggestionTile({super.key, required this.userPost});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.pushNamed(context, '/Post', arguments: userPost),
      leading: Icon(Icons.search),
      title: Text(userPost.post.title, maxLines: 1, overflow: TextOverflow.ellipsis),
    );
  }
}