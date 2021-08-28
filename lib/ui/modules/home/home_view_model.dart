import 'package:internative_app/init/locator.dart';
import 'package:internative_app/ui/models/response/res_user.dart';
import 'package:internative_app/ui/models/response/res_user_detail.dart';
import 'package:internative_app/ui/repositories/user_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_view_model.g.dart';

enum HomeState { Initial, Busy, Done, Error }

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  UserRepository repository = locator<UserRepository>();

  @observable
  HomeState state = HomeState.Initial;

  @observable
  List<ResUser> listFirends = [];

  @observable
  ResUserDetail? myProfileDetail;

  @observable
  String? message;

  @action
  Future<void> getFriends() async {
    state = HomeState.Busy;
    try {
      final result = await repository.getFriendList();
      if (result.hasError) {
        message = result.message;
        state = HomeState.Error;
      } else {
        listFirends = (result.data as List).map((e) => ResUser.fromJson(e)).toList();
        state = HomeState.Done;
      }
    } catch (e) {
      state = HomeState.Error;
    }
  }

  @action
  Future<void> getMyProfile() async {
    state = HomeState.Busy;
    try {
      final result = await repository.getMyProfile();
      if (result.hasError) {
        message = result.message;
        state = HomeState.Error;
      } else {
        myProfileDetail = ResUserDetail.fromJson(result.data);
        state = HomeState.Done;
      }
    } catch (e) {
      state = HomeState.Error;
    }
  }
}
