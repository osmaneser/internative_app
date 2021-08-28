import 'package:internative_app/core/services/dialog_service.dart';
import 'package:internative_app/init/locator.dart';
import 'package:internative_app/ui/models/response/res_user.dart';
import 'package:internative_app/ui/repositories/user_repository.dart';
import 'package:mobx/mobx.dart';

part 'user_list_view_model.g.dart';

class UserListViewModel = _UserListViewModelBase with _$UserListViewModel;

enum UserState { Initial, Busy, Done, Error }

abstract class _UserListViewModelBase with Store {
  UserRepository repository = locator<UserRepository>();

  @observable
  UserState state = UserState.Initial;

  @observable
  List<ResUser> listUser = [];

  @action
  Future<void> getUsers(context) async {
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
}
