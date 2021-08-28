import 'package:internative_app/core/base/base_repository.dart';
import 'package:internative_app/core/models/api_result.dart';
import 'package:internative_app/ui/models/request/req_add_to_firend.dart';
import 'package:internative_app/ui/models/request/req_remove_from_friend.dart';
import 'package:internative_app/ui/models/request/req_user_detail.dart';

class UserRepository extends BaseRepository {
  Future<ApiResult<dynamic>> getUsers() async {
    return await http.httpGet(url: "User/GetUsers");
  }

  Future<ApiResult<dynamic>> getUserDetail(ReqUserDetail userDetail) async {
    return await http.httpPost(url: "User/GetUserDetails", data: userDetail);
  }

  Future<ApiResult<dynamic>> getMyProfile() async {
    return await http.httpGet(url: "Account/Get");
  }

  Future<ApiResult<dynamic>> getFriendList() async {
    return await http.httpGet(url: "Account/GetFriendList");
  }


  Future<ApiResult<dynamic>> addToFriends(ReqAddToFriend addToFriend) async {
    return await http.httpPost(url: "User/AddToFriends", data: addToFriend);
  }

  Future<ApiResult<dynamic>> removeFromFriends(ReqRemoveFromFriend removeFromFriend) async {
    return await http.httpPost(url: "User/RemoveFromFriends", data: removeFromFriend);
  }
}
