import 'package:flutter/material.dart';

class OeLabelText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  const OeLabelText({
    Key? key,
    required this.text,
    this.fontWeight = FontWeight.bold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.pinkAccent,
        fontSize: 12,
        fontWeight: fontWeight,
      ),
    );
  }
}
