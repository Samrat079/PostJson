import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:post_json/screens/WelcomePage/Widgets/RichText01.dart';

class PageView01 extends StatelessWidget {
  const PageView01({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(36.0),
      child: Column(
        spacing: 36,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            spacing: 36,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FaIcon(
                FontAwesomeIcons.fileCode,
                size: 124,
                color: Theme.of(context).colorScheme.primary,
              ),
              FaIcon(
                FontAwesomeIcons.flutter,
                size: 124,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ],
          ),
          RichText01(
            string1: 'Flutter ',
            string2: 'Dummy Json',
            string3: ' Demo',
            fontSize: 40,
          ),
          Divider(),
          Text(
            "Flutter multiplatform app with dummy json api",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
