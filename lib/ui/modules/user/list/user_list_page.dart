import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:internative_app/core/reusuable_widgets/circular_progress/oe_circular_progress.dart';
import 'package:internative_app/init/locator.dart';
import 'package:internative_app/ui/modules/user/list/user_list_view_model.dart';
import 'package:internative_app/ui/reusuable_widgets/profile_card/profile_card.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vModelUser = locator<UserListViewModel>();
    if (vModelUser.state == UserState.Initial) vModelUser.getUsers(context);

    return Scaffold(
      body: Observer(
        builder: (_) {
          if (vModelUser.state == UserState.Busy) {
            return OeCircularProgress();
          } else if (vModelUser.state == UserState.Done) {
            return RefreshIndicator(
              child: ListView(
                children: vModelUser.listUser
                    .map(
                      (e) => OeProfileCard(
                        userId: e.id,
                        isFollowed: true,
                        name: e.fullName,
                        email: e.email,
                        imgUrl: e.profilePhoto,
                      ),
                    )
                    .toList(),
              ),
              onRefresh: () {
                return vModelUser.getUsers(context);
              },
            );
          } else {
            return Text("Hata");
          }
        },
      ),
    );
  }
}
