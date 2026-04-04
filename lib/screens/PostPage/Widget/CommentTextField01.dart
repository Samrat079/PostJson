import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:post_json/Services/CommentsServices/CommentsServices.dart';

import '../../../Models/Comments/Comment.dart';

class CommentTextField01 extends StatefulWidget {
  final int postId;
  final Function(Comment) onCommentAdded;

  const CommentTextField01({
    super.key,
    required this.postId,
    required this.onCommentAdded,
  });

  @override
  State<CommentTextField01> createState() => _CommentTextField01State();
}

class _CommentTextField01State extends State<CommentTextField01> {
  @override
  void initState() {
    super.initState();
  }
  final _comment_controller = TextEditingController();

  void submitHandler() async {
    final res = await CommentsServices().addComment(
      _comment_controller.text,
      widget.postId,
    );
    widget.onCommentAdded(res);
    _comment_controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 8, right: 8, bottom: 2),
        child: TextField(
          controller: _comment_controller,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.comment_outlined),
            suffixIcon: IconButton(
              onPressed: submitHandler,
              icon: Icon(Icons.send_outlined),
              color: Colors.blue,
            ),
            fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
            hintText: 'Join the conversation',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
          ),
        ),
      ),
    );
  }
}
