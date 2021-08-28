import 'package:get_it/get_it.dart';
import 'package:internative_app/core/services/http_service.dart';
import 'package:internative_app/ui/modules/auth/sign_in/sign_in_view_model.dart';
import 'package:internative_app/ui/modules/profile/profile_detail/profile_detail_view_model.dart';
import 'package:internative_app/ui/modules/user/list/user_list_view_model.dart';
import 'package:internative_app/ui/repositories/login_repository.dart';
import 'package:internative_app/ui/repositories/user_repository.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  locator.registerSingleton<HttpService>(HttpService());
  locator.registerSingleton<LoginRepository>(LoginRepository());
  locator.registerSingleton<UserRepository>(UserRepository());
  locator.registerSingleton<SignInViewModel>(SignInViewModel());
  locator.registerSingleton<UserListViewModel>(UserListViewModel());
  locator.registerSingleton<ProfileDetailViewModel>(ProfileDetailViewModel());
  
}
