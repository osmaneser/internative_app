import 'package:flutter/material.dart';
import 'package:internative_app/core/reusuable_widgets/button/oe_button.dart';

class OeFollowButton extends StatelessWidget {
  final String userId;
  const OeFollowButton({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OeButton(onTap: () {}, text: "Takip Et/Çık");
  }
}
