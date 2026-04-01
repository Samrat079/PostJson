import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GradientContainer01 extends StatelessWidget {
  final Widget child;

  const GradientContainer01({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.surfaceContainerLowest,
            Theme.of(context).colorScheme.surfaceContainerHigh,
          ],
        ),
      ),
      child: child,
    );
  }
}
