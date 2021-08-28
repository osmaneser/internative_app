import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:internative_app/core/mixins/date_parser.dart';
import 'package:internative_app/core/reusuable_widgets/circular_progress/oe_circular_progress.dart';
import 'package:internative_app/core/reusuable_widgets/text/oe_content_text.dart';
import 'package:internative_app/core/reusuable_widgets/text/oe_label.dart';
import 'package:internative_app/init/locator.dart';
import 'package:internative_app/ui/models/response/res_user_detail.dart';
import 'package:internative_app/ui/modules/profile/profile_detail/profile_detail_view_model.dart';
import 'package:internative_app/ui/reusuable_widgets/follow_button/follow_button.dart';
import 'package:internative_app/ui/reusuable_widgets/profile_image/profile_image_avatar.dart';

class ProfileDetailPage extends StatelessWidget {
  final String userId;
  const ProfileDetailPage({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vModelProfileDetail = locator<ProfileDetailViewModel>();
    if (vModelProfileDetail.state == ProfileDetailState.Initial) vModelProfileDetail.getProfileDetail(userId);
    return Scaffold(
      body: Observer(
        builder: (_) {
          if (vModelProfileDetail.state == ProfileDetailState.Busy) {
            return OeCircularProgress();
          } else if (vModelProfileDetail.state == ProfileDetailState.Done) {
            return getDetailWidget(vModelProfileDetail.userDetail!);
          } else {
            return Center(child: Text(vModelProfileDetail.message));
          }
        },
      ),
    );
  }

  Row getProfileInfo(
    OeLabelText label,
    OeContentText content,
  ) {
    return Row(
      children: [Expanded(flex: 48,child: label), Expanded(flex: 1,child: OeLabelText(text:":")),Spacer(flex: 3,) ,Expanded(flex: 48,child: Align(alignment: Alignment.centerLeft,child: content))],
    );
  }

  Center getDetailWidget(ResUserDetail userDetail) {
    final _profileInfo = Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          getProfileInfo(OeLabelText(text: "Ad Soyad"), OeContentText(text: userDetail.fullName)),
          SizedBox(
            height: 16,
          ),
          getProfileInfo(OeLabelText(text: "E Posta"), OeContentText(text: userDetail.email)),
          SizedBox(
            height: 16,
          ),
          getProfileInfo(OeLabelText(text: "Doğum Tarihi"), OeContentText(text: "")),
        ],
      ),
    );

    return Center(
      child: Column(
        children: [
          Expanded(flex: 30, child: OeProfileImageAvatar(imgUrl: userDetail.profilePhoto)),
          Expanded(flex: 5, child: OeFollowButton(isFollowed: false)),
          Spacer(flex: 5,),
          Expanded(flex: 60, child: _profileInfo)
        ],
      ),
    );
  }
}
