import 'package:flutter/material.dart';

class OeProfileImageAvatarThumb extends StatelessWidget {
  final String imgUrl;
  const OeProfileImageAvatarThumb({Key? key,required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30.0,
      backgroundImage: NetworkImage("$imgUrl"),
      backgroundColor: Colors.transparent,
    );
  }
}
