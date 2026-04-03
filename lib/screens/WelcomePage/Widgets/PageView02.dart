import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:post_json/UnStructured/Utils/UrlLauncher/UrlLauncher.dart';
import 'package:post_json/screens/WelcomePage/Widgets/RichText01.dart';

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

              /// text part
              RichText01(
                string1: 'Clean and',
                string2: ' scalable structure with Model, View, View Model',
                string3: ' (MVVM) architecture.',
                fontSize: 32,
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
                    onPressed: () => UrlLauncher.openUrl(
                      'https://github.com/Samrat079/PostJson',
                    ),
                    icon: FaIcon(FontAwesomeIcons.github),
                  ),
                  IconButton(
                    onPressed: () => UrlLauncher.openUrl(
                      'https://leetcode.com/u/samrat079/',
                    ),
                    icon: FaIcon(FontAwesomeIcons.leetcode),
                  ),
                  IconButton(
                    onPressed: () => UrlLauncher.openUrl(
                      'https://www.linkedin.com/in/samrat079/',
                    ),
                    icon: FaIcon(FontAwesomeIcons.linkedin),
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
