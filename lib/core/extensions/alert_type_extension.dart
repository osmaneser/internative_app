import 'package:internative_app/core/enums/aler_type_enum.dart';

extension DialogTitleExtension on AlertType {
  String get getTitleByAlertType {
    switch (this) {
      case AlertType.Error:
        return "Hata!";
      case AlertType.Info:
        return "Bilgi";
      case AlertType.Question:
        return "İşlem Onayı";
      case AlertType.Success:
        return "Başarılı";
      case AlertType.Warning:
        return "Uyarı!";
      default:
        return "Mesaj";
    }
  }
}
