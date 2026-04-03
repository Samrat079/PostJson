import 'package:flutter/material.dart';

class RichText01 extends StatelessWidget {
  final String string1, string2, string3;
  final double fontSize;

  const RichText01({
    super.key,
    required this.string1,
    required this.string2,
    required this.string3,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: string1,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          TextSpan(
            text: string2,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          TextSpan(
            text: string3,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
