import 'package:flutter/material.dart';

class ShadowBox extends StatelessWidget {
  const ShadowBox({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: child,
      ),
    );
  }
}
