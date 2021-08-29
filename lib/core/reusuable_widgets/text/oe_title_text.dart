import 'package:flutter/material.dart';

class OeTitleText extends StatelessWidget {
  final String text;
  final Color? color;
  const OeTitleText({Key? key, required this.text, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color != null ? color : Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold
      ),
    );
  }
}
