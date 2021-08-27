import 'package:get_it/get_it.dart';
import 'package:internative_app/core/services/http_service.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  locator.registerSingleton<HttpService>(HttpService());
  
}
