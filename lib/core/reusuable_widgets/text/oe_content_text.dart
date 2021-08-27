import 'package:flutter/material.dart';

class OeContentText extends StatelessWidget {
  
  final String text;
  const OeContentText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: Colors.pink, fontSize: 12),
    );
  }
}
