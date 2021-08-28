import 'package:internative_app/init/locator.dart';
import 'package:internative_app/ui/models/request/req_user_detail.dart';
import 'package:internative_app/ui/models/response/res_user_detail.dart';
import 'package:internative_app/ui/repositories/user_repository.dart';
import 'package:mobx/mobx.dart';

part 'profile_detail_view_model.g.dart';

enum ProfileDetailState { Initial, Busy, Done, Error }

class ProfileDetailViewModel = _ProfileDetailViewModelBase with _$ProfileDetailViewModel;

abstract class _ProfileDetailViewModelBase with Store {
  UserRepository repository = locator<UserRepository>();
  @observable
  bool isOwner = false;

  @observable
  ResUserDetail? userDetail;

  @observable
  String message = "";

  @observable
  ProfileDetailState state = ProfileDetailState.Initial;

  @action
  Future<void> getProfileDetail(String userId) async {
    try {
      state = ProfileDetailState.Busy;
      final result = await repository.getUserDetail(ReqUserDetail(id: userId));
      if (result.hasError) {
        message = result.message;
        state = ProfileDetailState.Error;
      } else {
        userDetail = ResUserDetail.fromJson(result.data);
        state = ProfileDetailState.Done;
      }
    } catch (e) {
      //message = e.message;
      state = ProfileDetailState.Error;
    }
  }
}
