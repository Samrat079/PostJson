import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../Services/AuthServices/AuthServices.dart';

class PageView03 extends StatelessWidget {
  const PageView03({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(36.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 36,
        children: [
          SvgPicture.asset('Assets/Svg/Logo02.svg', width: 200, height: 200),
          //////////      header text       ///////////////////
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Wanna have",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
                TextSpan(
                  text: " a Look Around ? Let's ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                TextSpan(
                  text: "Get Started!!!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
              ],
            ),
          ),

          Divider(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 36,
            children: [

              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    AuthServices().setOnboarded(true);
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  label: Text("Take a tour"),
                  icon: Icon(Icons.home_outlined),
                ),
              ),

              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Theme.of(context).colorScheme.surface,
                  ),
                  onPressed: () {
                    AuthServices().setOnboarded(true);
                    Navigator.pushReplacementNamed(context, '/');
                    Navigator.pushNamed(context, '/Profile');
                  },
                  label: Text("Login"),
                  icon: Icon(Icons.login_outlined),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
