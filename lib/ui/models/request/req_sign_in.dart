// To parse this JSON data, do
//
//     final reqSignIn = reqSignInFromJson(jsonString);

import 'dart:convert';

ReqSignIn reqSignInFromJson(String str) => ReqSignIn.fromJson(json.decode(str));

String reqSignInToJson(ReqSignIn data) => json.encode(data.toJson());

class ReqSignIn {
    ReqSignIn({
       required this.email,
       required this.password,
    });

    String email;
    String password;

    factory ReqSignIn.fromJson(Map<String, dynamic> json) => ReqSignIn(
        email: json["Email"],
        password: json["Password"],
    );

    Map<String, dynamic> toJson() => {
        "Email": email,
        "Password": password,
    };
}
