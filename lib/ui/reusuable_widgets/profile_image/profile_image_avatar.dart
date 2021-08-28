import 'package:flutter/material.dart';

class OeProfileImageAvatar extends StatelessWidget {
  final String imgUrl;
  const OeProfileImageAvatar({Key? key, required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        radius: 60.0,
        backgroundImage: NetworkImage("$imgUrl"),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
