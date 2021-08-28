import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:internative_app/core/reusuable_widgets/button/oe_button.dart';
import 'package:internative_app/core/reusuable_widgets/text/oe_content_text.dart';
import 'package:internative_app/core/reusuable_widgets/text/oe_label.dart';
import 'package:internative_app/init/locator.dart';
import 'package:internative_app/ui/modules/home/home_view_model.dart';
import 'package:internative_app/ui/modules/profile/profile_detail/profile_detail_page.dart';
import 'package:internative_app/ui/modules/user/user_view_model.dart';
import 'package:internative_app/ui/reusuable_widgets/profile_image/profile_image_avatar_thumb.dart';

class OeProfileCard extends StatelessWidget {
  final bool isFollowed;
  final bool isLoading;
  final bool showFollowButton;
  final String userId;
  final String name;
  final String email;
  final String imgUrl;
  final Function(String) onTap;
  const OeProfileCard(
      {Key? key, required this.name, required this.email, required this.imgUrl, required this.isFollowed, required this.userId, required this.onTap,required this.isLoading, this.showFollowButton = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vModelHome = locator<HomeViewModel>();

    final vModelUser = locator<UserViewModel>();

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileDetailPage(
              userId: userId,
            ),
          ),
        );
      },
      child: Container(
        child: ListTile(
          title: OeLabelText(text: name),
          subtitle: OeContentText(text: email),
          leading: OeProfileImageAvatarThumb(imgUrl: imgUrl),
          trailing: showFollowButton ? Observer(
            builder: (_) {
              return OeButton(
                isLoading: isLoading,
                onTap: () => onTap(userId),
                text: vModelHome.myProfileDetail!.friendIds.any((element) => element == userId) ? "Takipten Çık" : "Takip Et",
              );
            },
          ) : null,
        ),
      ),
    );
  }
}
