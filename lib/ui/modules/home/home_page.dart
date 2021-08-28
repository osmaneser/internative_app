import 'package:flutter/material.dart';
import 'package:internative_app/core/reusuable_widgets/text/oe_title_text.dart';
import 'package:internative_app/init/locator.dart';
import 'package:internative_app/ui/modules/home/home_view_model.dart';
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
          children: [
            Expanded(flex: 49, child: getMenuItem("Profilim", "")),
            Spacer(
              flex: 2,
            ),
            Expanded(
              flex: 49,
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UserListPage()));
                },
                child: getMenuItem("Kişiler", ""),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column getMenuItem(String name, String imgUrl) {
    return Column(
      children: [OeProfileImageAvatar(imgUrl: imgUrl), OeTitleText(text: name)],
    );
  }
}
