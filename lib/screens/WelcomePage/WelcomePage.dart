import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/Services/AuthServices/AuthServices.dart';
import 'package:untitled/UnStructured/Theme/GradientContainer01.dart';
import 'package:untitled/screens/HomePage/Widget/SideBar01.dart';
import 'package:untitled/screens/WelcomePage/Widgets/PageView01.dart';
import 'package:untitled/screens/WelcomePage/Widgets/PageView02.dart';
import 'package:untitled/screens/WelcomePage/Widgets/PageView03.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer01(
        child: PageView(
          children: [
            PageView01(),
            PageView02(),
            PageView03()
          ],
        ),
      ),
    );
  }
}
