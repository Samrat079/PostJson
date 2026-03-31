import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Services/AuthServices/AuthServices.dart';

class SideBar01 extends StatelessWidget {
  const SideBar01({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Column(
                children: const [
                  Icon(CupertinoIcons.news, size: 120),
                  SizedBox(height: 12),
                  Text(
                    "Dummy Json App",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            const Divider(),


            // 🔹 Centered Menu Items
            Column(
              children: [
                ListTile(
                  leading: const Icon(CupertinoIcons.home),
                  title: const Text("Home"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/");
                  },
                ),
                ListTile(
                  leading: const Icon(CupertinoIcons.person),
                  title: const Text("Profile"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(
                      context,
                      "/Profile",
                      arguments: AuthServices().userId,
                    );
                  },
                ),
              ],
            ),

            const Spacer(), // ⬇ keeps them centered

            const Divider(),

            // 🔹 Logout at Bottom
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.red),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onTap: () {
                  AuthServices().logout();

                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/Profile");

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text("Logout successfully"),
                      behavior: SnackBarBehavior.floating,
                      margin: const EdgeInsets.all(12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}