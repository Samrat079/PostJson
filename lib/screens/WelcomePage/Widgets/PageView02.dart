import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/UnStructured/Utils/UrlLauncher/UrlLauncher.dart';

class PageView02 extends StatelessWidget {
  const PageView02({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 36,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('Assets/Images/page_view_01.png'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 36,
            children: [
              //////////      header text       ///////////////////
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Clean and",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                    TextSpan(
                      text: " scalable structure with Model, View, View Model",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    TextSpan(
                      text: " (MVVM) architecture.",
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

              Text(
                "Want to know more about my app, checkout my github with the links below",
                textAlign: TextAlign.center,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => UrlLauncher.openUrl('https://github.com/Samrat079/PostJson'),
                    icon: FaIcon(FontAwesomeIcons.github),
                  ),
                  IconButton(
                    onPressed: () => UrlLauncher.openUrl('https://leetcode.com/u/samrat079/'),
                    icon: FaIcon(FontAwesomeIcons.linkedin),
                  ),
                  IconButton(
                    onPressed: () => UrlLauncher.openUrl('https://www.linkedin.com/in/samrat079/'),
                    icon: FaIcon(FontAwesomeIcons.leetcode),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
