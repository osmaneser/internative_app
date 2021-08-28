import 'package:flutter/material.dart';

class OeContentText extends StatelessWidget {
  final String text;
  final Color? color;
  const OeContentText({Key? key, required this.text, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color != null ? color : Colors.white, fontSize: 12),
    );
  }
}
