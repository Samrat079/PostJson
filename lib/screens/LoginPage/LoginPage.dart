import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Services/AuthServices/AuthServices.dart';
import 'package:untitled/Services/UserServices/UserServices.dart';

import '../../Models/User/User.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() async {
    final user = await AuthServices().login(
      _userNameController.text,
      _passwordController.text,
    );

    if (user != null) {
      await UserServices().currUser();
      Navigator.pushReplacementNamed(context, '/Profile', arguments: UserServices().user.id);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Login failed")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              margin: EdgeInsets.all(34),
              child: Form(
                key: _loginKey,
                child: Padding(
                  padding: EdgeInsetsGeometry.all(36),
                  child: Column(
                    spacing: 12,
                    children: [
                      Icon(Icons.lock, size: 86),
                      Text("Login"),
                      TextFormField(
                        controller: _userNameController,
                        decoration: InputDecoration(
                          label: Text("UserName"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          label: Text("Password"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => _login(),
                        child: Text("Login"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
