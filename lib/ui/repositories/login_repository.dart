
import 'package:internative_app/core/base/base_repository.dart';
import 'package:internative_app/core/models/api_result.dart';
import 'package:internative_app/ui/models/request/req_sign_in.dart';

class LoginRepository extends BaseRepository {
  Future<ApiResult<dynamic>> signIn(ReqSignIn signIn) async {
    final result = await http.httpPost(url: "Login/SignIn", data: signIn);
    return result;
  }
}
