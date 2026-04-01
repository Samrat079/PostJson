import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Models/User/User.dart';
import 'package:untitled/Services/UserServices/UserServices.dart';
import 'package:untitled/UnStructured/Theme/GradientContainer01.dart';

import '../../Services/AuthServices/AuthServices.dart';
import '../../UnStructured/Widget/LoadingWidget.dart';

class TestCredentials extends StatefulWidget {
  const TestCredentials({super.key});

  @override
  State<TestCredentials> createState() => _TestCredentialsState();
}

class _TestCredentialsState extends State<TestCredentials> {
  void _login(String username, String password) async {
    try {
      await AuthServices().login(username, password);
      await UserServices().currUser();

      Navigator.pushNamedAndRemoveUntil(
        context,
        '/Profile',
        (route) => route.isFirst,
        arguments: UserServices().user.id,
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e"), behavior: SnackBarBehavior.floating,));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test Credentials")),
      body: GradientContainer01(
        child: FutureBuilder<List<User>>(
          future: UserServices().allUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return LoadingWidget();
            }
            if (snapshot.hasError) return Text("Error: ${snapshot.error}");
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text("No data");
            }
            final users = snapshot.data!;

            return ListView.separated(
              shrinkWrap: true,
              itemCount: users.length,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  title: Text(user.username),
                  subtitle: Text(user.password),
                  onTap: () => _login(user.username, user.password),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.image),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
