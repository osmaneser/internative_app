import 'package:flutter/material.dart';
import 'package:internative_app/core/reusuable_widgets/text/oe_content_text.dart';
import 'package:internative_app/core/reusuable_widgets/text/oe_label.dart';
import 'package:internative_app/ui/modules/profile/profile_detail/profile_detail_page.dart';
import 'package:internative_app/ui/reusuable_widgets/follow_button/follow_button.dart';
import 'package:internative_app/ui/reusuable_widgets/profile_image/profile_image_avatar_thumb.dart';

class OeProfileCard extends StatelessWidget {
  final bool isFollowed;
  final String userId;
  final String name;
  final String email;
  final String imgUrl;
  const OeProfileCard({Key? key, required this.name, required this.email, required this.imgUrl, required this.isFollowed,required this.userId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileDetailPage(userId: userId,)));
      },
      child: Container(
        child: ListTile(
          title: OeLabelText(text: name),
          subtitle: OeContentText(text: email),
          leading: OeProfileImageAvatarThumb(imgUrl: imgUrl),
          trailing: OeFollowButton(
            isFollowed: isFollowed,
          ),
        ),
      ),
    );
  }
}
