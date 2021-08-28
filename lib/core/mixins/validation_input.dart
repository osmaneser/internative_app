mixin OeValidation {
  String emailPattern =
        "^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$";

  String? validateEmail(String? value) =>
      value != null ? (RegExp(emailPattern).hasMatch(value) ? null : "Hatalı E posta") : "Bu alan gerekli";

  String numberPattern = "^[0-9]*\$";
  String? validatePassword(String? value) => (value != null && value.isNotEmpty) ? (RegExp(numberPattern).hasMatch(value) ? null : "Sadece sayı giriniz") : "Bu alan gerekli";
}
