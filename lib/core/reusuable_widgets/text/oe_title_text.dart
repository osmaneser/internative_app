import 'package:flutter/material.dart';

class OeTitleText extends StatelessWidget {
  final String text;
  const OeTitleText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.pinkAccent,
        fontSize: 16,
        fontWeight: FontWeight.bold
      ),
    );
  }
}
