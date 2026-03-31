import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Models/Posts/Post.dart';
import 'package:untitled/Models/UserPost/UserPost.dart';

class TagsRow extends StatelessWidget {
  final Post post;

  const TagsRow({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var tag in post.tags)
          Card(
            color: Colors
                .primaries[math.Random().nextInt(Colors.primaries.length)],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(90),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Text(tag, style: TextStyle(color: Colors.white)),
            ),
          ),
      ],
    );
  }
}
