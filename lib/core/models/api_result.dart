// To parse this JSON data, do
//
//     final apiResult = apiResultFromJson(jsonString);

import 'dart:convert';

import 'package:internative_app/core/models/validation_error.dart';

ApiResult apiResultFromJson(String str) => ApiResult.fromJson(json.decode(str));

String apiResultToJson(ApiResult data) => json.encode(data.toJson());

class ApiResult<T> {
    ApiResult({
       required this.validationErrors,
       required this.hasError,
       required this.message,
       required this.data,
    });

    List<ValidationError> validationErrors;
    bool hasError;
    dynamic message;
    T data;

    factory ApiResult.fromJson(Map<String, dynamic> json) => ApiResult(
        validationErrors: List<ValidationError>.from(json["ValidationErrors"].map((x) => x)),
        hasError: json["HasError"],
        message: json["Message"],
        data: (json["Data"] as dynamic),
    );

    Map<String, dynamic> toJson() => {
        "ValidationErrors": List<dynamic>.from(validationErrors.map((x) => x)),
        "HasError": hasError,
        "Message": message,
        "Data": data,
    };
}