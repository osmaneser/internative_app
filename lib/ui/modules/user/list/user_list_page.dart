import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:internative_app/core/reusuable_widgets/circular_progress/oe_circular_progress.dart';
import 'package:internative_app/init/locator.dart';
import 'package:internative_app/ui/modules/home/home_view_model.dart';
import 'package:internative_app/ui/reusuable_widgets/profile_card/profile_card.dart';

import '../user_view_model.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vModelUser = locator<UserViewModel>();
    final vModelHome = locator<HomeViewModel>();
    String selectedUserId = "";
    if (vModelUser.state == UserState.Initial) vModelUser.getUsers(context);

    return Scaffold(
      body: Observer(
        builder: (_) {
          return RefreshIndicator(
            child: Stack(
              children: [
                ListView(
                  children: vModelUser.listUser.map((e) {
                    return OeProfileCard(
                      userId: e.id,
                      isFollowed: vModelHome.userDetail!.friendIds.any((element) => element == e.id),
                      name: e.fullName,
                      email: e.email,
                      imgUrl: e.profilePhoto,
                      isLoading: vModelUser.state == UserState.Busy && e.id == selectedUserId,
                      onTap: (userId) async {
                        selectedUserId = userId;
                        {
                          if (vModelHome.userDetail!.friendIds.any((element) => element == e.id)) {
                            await vModelUser.removeFriend(userId);
                          } else {
                            await vModelUser.addFriend(userId);
                          }
                        }
                        selectedUserId = "";
                      },
                    );
                  }).toList(),
                ),
                if (vModelUser.state == UserState.Busy && selectedUserId == "") OeCircularProgress(text: "Kişi Listesi Alınıyor",)
              ],
            ),
            onRefresh: () {
              return vModelUser.getUsers(context);
            },
          );
        },
      ),
    );
  }
}
