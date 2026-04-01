import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Services/AuthServices/AuthServices.dart';
import 'package:untitled/Services/UserServices/UserServices.dart';

class ProfileAccountActionCard extends StatelessWidget {
  const ProfileAccountActionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsetsGeometry.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(onPressed: () {}, child: Text("Edit User")),
            ElevatedButton(
              onPressed: () {
                AuthServices().logout();
                Navigator.pop(context);
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
