import 'package:flutter/material.dart';
import 'package:untitled/Services/PostsServices/PostsServices.dart';
import 'package:untitled/Services/UserPostServices/UserPostService.dart';
import 'package:untitled/Services/UserServices/UserServices.dart';
import 'package:untitled/UnStructured/Widget/LoadingWidget.dart';
import 'package:untitled/screens/SearchDelegate/Widget/NotFoundPage.dart';
import 'package:untitled/screens/SearchDelegate/Widget/SuggestionTile.dart';

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
    return FutureBuilder(
      future: UserPostService().getPostsByQuery(query),
      builder: (context, snapshot) {
        if (query.isEmpty) {
          return SizedBox();
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
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
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
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
    );
  }
}
