import 'package:internative_app/core/services/dialog_service.dart';
import 'package:internative_app/init/locator.dart';
import 'package:internative_app/ui/models/request/req_add_to_firend.dart';
import 'package:internative_app/ui/models/request/req_remove_from_friend.dart';
import 'package:internative_app/ui/models/response/res_user.dart';
import 'package:internative_app/ui/modules/home/home_view_model.dart';
import 'package:internative_app/ui/repositories/user_repository.dart';
import 'package:mobx/mobx.dart';

part 'user_view_model.g.dart';

enum UserState { Initial, Busy, Done, Error }

class UserViewModel = _UserViewModelBase with _$UserViewModel;

abstract class _UserViewModelBase with Store {
  UserRepository repository = locator<UserRepository>();

  @observable
  UserState state = UserState.Initial;

  @observable
  List<ResUser> listUser = [];

  @action
  Future<void> getUsers(context) async {
    listUser = [];
    state = UserState.Busy;
    await Future.delayed(Duration(seconds: 2));
    try {
      final result = await repository.getUsers();
      if (result.hasError) {
        DialogService.durationDialog(context: context, message: result.message);
        state = UserState.Error;
      } else {
        listUser = (result.data as List).map((e) => ResUser.fromJson(e)).toList();
        state = UserState.Done;
      }
    } catch (e) {
      state = UserState.Error;
    }
  }

  @action
  Future<void> addFriend(String userId) async {
    state = UserState.Busy;
    try {
      final result = await repository.addToFriends(ReqAddToFriend(userId: userId));
      if (result.hasError) {
        state = UserState.Error;
      } else {
        final vModelHome = locator<HomeViewModel>();
        vModelHome.myProfileDetail!.friendIds.add(userId);
        final findItem = listUser.firstWhere((element) => element.id == userId);
        vModelHome.listFirends.add(findItem);

        state = UserState.Done;
      }
    } catch (e) {
      state = UserState.Error;
    }
  }

  @action
  Future<void> removeFriend(String userId) async {
    state = UserState.Busy;
    try {
      final result = await repository.removeFromFriends(ReqRemoveFromFriend(userId: userId));
      if (result.hasError) {
        state = UserState.Error;
      } else {
        final vModelHome = locator<HomeViewModel>();
        vModelHome.myProfileDetail!.friendIds.remove(userId);
        vModelHome.listFirends.removeWhere((element) => element.id == userId);

        state = UserState.Done;
      }
    } catch (e) {
      state = UserState.Error;
    }
  }
}
