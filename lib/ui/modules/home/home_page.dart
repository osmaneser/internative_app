import 'package:flutter/material.dart';
import 'package:internative_app/core/enums/image_type_enum.dart';
import 'package:internative_app/core/reusuable_widgets/text/oe_title_text.dart';
import 'package:internative_app/init/locator.dart';
import 'package:internative_app/ui/modules/home/home_view_model.dart';
import 'package:internative_app/ui/modules/profile/profile_detail/profile_detail_page.dart';
import 'package:internative_app/ui/modules/user/list/user_list_page.dart';
import 'package:internative_app/ui/reusuable_widgets/profile_image/profile_image_avatar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vModelHome = locator<HomeViewModel>();
    if (vModelHome.state == HomeState.Initial) {
      //vModelHome.getFriends();
      vModelHome.getMyProfile();
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 5),
            Expanded(
                flex: 44,
                child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileDetailPage(userId: vModelHome.myProfileDetail!.id)));
                    },
                    child: getMenuItem("Profilim", "assets/images/svg/profile_icon.svg"))),
            Spacer(flex: 2),
            Expanded(
              flex: 44,
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UserListPage()));
                },
                child: getMenuItem("Kişiler", "assets/images/svg/friends_icon.svg"),
              ),
            ),
            Spacer(flex: 5),
          ],
        ),
      ),
    );
  }

  Column getMenuItem(String name, String imgUrl) {
    return Column(
      children: [
        OeProfileImageAvatar(
          imgUrl: imgUrl,
          imageType: ImageType.Svg,
        ),
        SizedBox(
          height: 8,
        ),
        OeTitleText(text: name)
      ],
    );
  }
}
