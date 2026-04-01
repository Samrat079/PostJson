import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Services/PostsServices/PostsServices.dart';
import 'package:untitled/Services/UserPostServices/UserPostService.dart';
import 'package:untitled/Services/UserServices/UserServices.dart';
import 'package:untitled/UnStructured/Theme/GradientContainer01.dart';
import 'package:untitled/UnStructured/Widget/LoadingWidget.dart';

import '../../Models/User/User.dart';
import 'Widget/ProfileAvatar.dart';
import 'Widget/ProfileInfoCard.dart';
import 'Widget/ProfilePostBuilder.dart';

class ProfilePage extends StatelessWidget {
  final int args;

  const ProfilePage({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ProfilePage")),
      body: GradientContainer01(
        child: FutureBuilder<User>(
          future: UserServices().userById(args),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingWidget();
            }
        
            // ❌ Error
            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }
        
            // ⚠️ No data
            if (!snapshot.hasData) {
              return const Center(child: Text("No user found"));
            }
        
            // ✅ Data available
            final user = snapshot.data!;
        
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Column(
                spacing: 24,
                children: [
                  ///////////////////      User details         //////////////////////////
                  ProfileAvatar(user: user),
        
                  Profileinfocard(user: user),
        
                  // ProfileAccountActionCard(), // No longer needed
                  const Divider(),
        
                  //////////////////////     User Posts       //////////////////////////
                  ProfilePostBuilder(
                    getPost: UserPostService().getUserPostById(user.id),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
    ;
  }
}
