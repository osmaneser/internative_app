mixin OeValidation {
  
  //TODO: Regex ile email pattern sağlanacak.
  String? validateEmail(String? value) =>
      value != null ? (value.contains("@") ? null : "Hatalı e posta") : "Bu alan gerekli";

  //TODO: Regex ile password pattern sağlanacak.
  String? validatePassword(String? value) => value != null ? (value.length > 5 ? null : "minimum 6 karakter") : "Bu alan gerekli";
}
