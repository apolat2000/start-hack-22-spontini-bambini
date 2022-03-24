import 'package:flutter/material.dart';

class TagWidget extends StatelessWidget {
  const TagWidget({Key? key, required this.text, required this.color})
      : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: color.withOpacity(0.15),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text(
          text,
          style: TextStyle(color: color),
        ),
      ),
    );
  }
}
