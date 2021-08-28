import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:internative_app/core/enums/image_type_enum.dart';
import 'package:internative_app/core/mixins/date_parser.dart';
import 'package:internative_app/core/reusuable_widgets/button/oe_button.dart';
import 'package:internative_app/core/reusuable_widgets/circular_progress/oe_circular_progress.dart';
import 'package:internative_app/core/reusuable_widgets/text/oe_content_text.dart';
import 'package:internative_app/core/reusuable_widgets/text/oe_label.dart';
import 'package:internative_app/core/reusuable_widgets/text/oe_title_text.dart';
import 'package:internative_app/init/locator.dart';
import 'package:internative_app/ui/models/response/res_user_detail.dart';
import 'package:internative_app/ui/modules/home/home_view_model.dart';
import 'package:internative_app/ui/modules/profile/profile_detail/profile_detail_view_model.dart';
import 'package:internative_app/ui/modules/user/user_view_model.dart';
import 'package:internative_app/ui/reusuable_widgets/profile_image/profile_image_avatar.dart';

class ProfileDetailPage extends StatelessWidget with DateFormatterMixin {
  final String userId;
  const ProfileDetailPage({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vModelProfileDetail = locator<ProfileDetailViewModel>();
    vModelProfileDetail.getProfileDetail(userId);
    return Scaffold(
      appBar: AppBar(
        title: OeTitleText(text: "Profil detayı"),
        centerTitle: true,
      ),
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

  Row getProfileInfo(OeLabelText label, OeContentText content) {
    return Row(
      children: [
        Expanded(flex: 48, child: label),
        Expanded(flex: 1, child: OeLabelText(text: ":")),
        Spacer(
          flex: 3,
        ),
        Expanded(flex: 48, child: Align(alignment: Alignment.centerLeft, child: content))
      ],
    );
  }

  Center getDetailWidget(ResUserDetail userDetail) {
    final vModelHome = locator<HomeViewModel>();
    final vModelUser = locator<UserViewModel>();

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
          getProfileInfo(OeLabelText(text: "Doğum Tarihi"), OeContentText(text: dateFormatter(userDetail.birthDate))),
        ],
      ),
    );

    return Center(
      child: Column(
        children: [
           Spacer(
            flex: 5
          ),
          Expanded(flex: 30, child: OeProfileImageAvatar(imgUrl: userDetail.profilePhoto, imageType: ImageType.Network,)),
          Spacer(
            flex: 5
          ),
          Expanded(
            flex: 5,
            child: Observer(builder: (_) {
              bool isFollowed = vModelHome.myProfileDetail!.friendIds.any((element) => element == userId);
              return vModelHome.myProfileDetail!.id != userId ? OeButton(
                isLoading: vModelUser.state == UserState.Busy,
                onTap: () {
                  if (isFollowed) {
                    vModelUser.removeFriend(userId);
                  } else {
                    vModelUser.addFriend(userId);
                  }
                },
                text: isFollowed ? "Takipten Çık" : "Takip Et",
              ) : OeContentText(text: "Profiliniz"); 
            }),
          ),
          Spacer(
            flex: 5,
          ),
          Expanded(flex: 50, child: _profileInfo)
        ],
      ),
    );
  }
}
