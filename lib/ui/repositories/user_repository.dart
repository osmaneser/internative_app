import 'package:internative_app/core/base/base_repository.dart';
import 'package:internative_app/core/models/api_result.dart';
import 'package:internative_app/ui/models/request/req_user_detail.dart';

class UserRepository extends BaseRepository {
  
  Future<ApiResult<dynamic>> getUsers() async {
    final result = await http.httpGet(url: "User/GetUsers");
    return result;
  }
  
  Future<ApiResult<dynamic>> getUserDetail(ReqUserDetail userDetail) async {
    final result = await http.httpPost(url: "User/GetUserDetails",data: userDetail);
    return result;
  }
}
