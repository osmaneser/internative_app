import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:internative_app/core/configs/path_config.dart';
import 'package:internative_app/core/enums/image_type_enum.dart';
import 'package:internative_app/core/reusuable_widgets/text/oe_content_text.dart';
import 'package:internative_app/core/reusuable_widgets/text/oe_title_text.dart';
import 'package:internative_app/init/locator.dart';
import 'package:internative_app/main.dart';
import 'package:internative_app/ui/modules/home/home_view_model.dart';
import 'package:internative_app/ui/modules/profile/profile_detail/profile_detail_page.dart';
import 'package:internative_app/ui/modules/user/list/user_list_page.dart';
import 'package:internative_app/ui/reusuable_widgets/profile_image/profile_image_avatar.dart';
import 'package:internative_app/ui/reusuable_widgets/profile_image/profile_image_avatar_thumb.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vModelHome = locator<HomeViewModel>();
    if (vModelHome.state == HomeState.Initial) {
      vModelHome.getMyProfile();
    }

    return Observer(
      builder: (_) => Scaffold(
        drawer: vModelHome.myProfileDetail != null ? _getDrawerWidget(context, vModelHome.myProfileDetail) : null,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 5),
              Expanded(
                  flex: 44,
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => ProfileDetailPage(userId: vModelHome.myProfileDetail!.id)));
                      },
                      child: getMenuItem("Profilim", "${PathConfig.svgPath}profile_icon.svg"))),
              Spacer(flex: 2),
              Expanded(
                flex: 44,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UserListPage()));
                  },
                  child: getMenuItem("Kişiler", "${PathConfig.svgPath}friends_icon.svg"),
                ),
              ),
              Spacer(flex: 5),
            ],
          ),
        ),
      ),
    );
  }

  Drawer _getDrawerWidget(context, detail) {
    return Drawer(
      child: Card(
        color: Color.fromRGBO(50, 50, 50, 1),
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(25, 25, 25, 1),
              ),
              child: Column(
                children: [
                  OeProfileImageAvatarThumb(imgUrl: detail.profilePhoto),
                  SizedBox(
                    height: 8,
                  ),
                  OeTitleText(text: detail.fullName),
                  SizedBox(
                    height: 8,
                  ),
                  OeContentText(text: detail.email),
                ],
              ),
            ),
            ListTile(
              title: const Text('Profilim'),
              leading: Icon(Icons.person),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileDetailPage(userId: detail.id)));
              },
            ),
            ListTile(
              title: const Text('Çıkış'),
              leading: Icon(Icons.exit_to_app),
              onTap: () {
                RestartWidget.restartApp(context);
              },
            ),
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
