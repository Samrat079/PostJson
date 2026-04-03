import 'package:flutter/material.dart';
import 'package:post_json/UnStructured/RouteGen.dart';
import 'package:post_json/UnStructured/Theme/ThemeData02.dart';
import 'package:post_json/screens/HomePage/Home.dart';

import 'Services/AuthServices/AuthServices.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthServices().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MyApp02();
  }
}

class MyApp02 extends StatelessWidget {
  const MyApp02({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      onGenerateRoute: RouteGen.generateRoute,
      theme: light,
      darkTheme: dark,
      themeMode: ThemeMode.system,
    );
  }
}
