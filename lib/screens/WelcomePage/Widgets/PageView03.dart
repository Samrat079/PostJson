import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageView03 extends StatelessWidget {
  const PageView03({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(36.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Get Started"),
          ElevatedButton.icon(
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context,
              '/Profile',
              (rought) => rought.isFirst,
            ),
            label: Text("Login"),
            icon: Icon(Icons.login_outlined),
          ),
        ],
      ),
    );
  }
}
