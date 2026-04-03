import 'package:flutter/material.dart';
import 'package:post_json/Services/PostsServices/PostsServices.dart';
import 'package:post_json/Services/UserPostServices/UserPostService.dart';
import 'package:post_json/Services/UserServices/UserServices.dart';
import 'package:post_json/UnStructured/Theme/GradientContainer01.dart';
import 'package:post_json/UnStructured/Widget/LoadingWidget.dart';
import 'package:post_json/screens/SearchDelegate/Widget/NotFoundPage.dart';
import 'package:post_json/screens/SearchDelegate/Widget/SuggestionTile.dart';

class SearchDelegatePage extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return GradientContainer01(
      child: FutureBuilder(
        future: UserPostService().getPostsByQuery(query),
        builder: (context, snapshot) {
          if (query.isEmpty) {
            return SizedBox();
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingWidget();
          }
          if (snapshot.hasError) return Text("Error: ${snapshot.error}");
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return NotFoundPage(query: query);
          }
          final data = snapshot.data!;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final userPost = data[index];
              return SuggestionTile(userPost: userPost);
            },
          );
        },
      ),
    );
  }
}
