import 'package:get_it/get_it.dart';
import 'package:internative_app/core/services/http_service.dart';
import 'package:internative_app/ui/modules/auth/sign_in/sign_in_view_model.dart';
import 'package:internative_app/ui/repositories/user_repository.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  locator.registerSingleton<HttpService>(HttpService());
  locator.registerSingleton<UserRepository>(UserRepository());
  locator.registerSingleton<SignInViewModel>(SignInViewModel());
  
}
