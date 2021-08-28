import 'package:flutter/material.dart';
import 'package:internative_app/core/reusuable_widgets/button/oe_button.dart';

class OeFollowButton extends StatelessWidget {
  final bool isFollowed;
  const OeFollowButton({Key? key, required this.isFollowed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OeButton(onTap: () {}, text: isFollowed ? "Takip Et" : "Takipten Çık");
  }
}
