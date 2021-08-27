import 'package:internative_app/core/services/http_service.dart';
import 'package:internative_app/init/locator.dart';

class BaseRepository {
  //TODO: bu kodda iyileştirme yapılacak
  HttpService http = locator<HttpService>();
  BaseRepository() {
    http = locator<HttpService>();
  }
}