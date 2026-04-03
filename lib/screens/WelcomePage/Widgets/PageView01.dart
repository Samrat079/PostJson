import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
              FaIcon(FontAwesomeIcons.fileCode, size: 124),
              FaIcon(
                FontAwesomeIcons.flutter,
                size: 124,
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ],
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Flutter ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
                TextSpan(
                  text: "Dummy Json",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                TextSpan(
                  text: " demo",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
              ],
            ),
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
