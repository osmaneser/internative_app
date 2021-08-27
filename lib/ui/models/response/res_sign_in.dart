// To parse this JSON data, do
//
//     final resSignIn = resSignInFromJson(jsonString);

import 'dart:convert';

ResSignIn resSignInFromJson(String str) => ResSignIn.fromJson(json.decode(str));

String resSignInToJson(ResSignIn data) => json.encode(data.toJson());

class ResSignIn {
    ResSignIn({
        required this.token,
    });

    String token;

    factory ResSignIn.fromJson(Map<String, dynamic> json) => ResSignIn(
        token: json["Token"],
    );

    Map<String, dynamic> toJson() => {
        "Token": token,
    };
}
