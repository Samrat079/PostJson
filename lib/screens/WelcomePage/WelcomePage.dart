import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Services/AuthServices/AuthServices.dart';
import 'package:untitled/UnStructured/Theme/GradientContainer01.dart';
import 'package:untitled/screens/HomePage/Widget/SideBar01.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientContainer01(
      child: Scaffold(
        drawer: SideBar01(),
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Welcome"),
          ],
        ),
      ),
    );
  }
}
