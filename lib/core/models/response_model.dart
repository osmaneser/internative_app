// To parse this JSON data, do
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:internative_app/core/models/api_result.dart';

ResponseModel responseModelFromJson(String str) => ResponseModel.fromJson(json.decode(str));

String responseModelToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel<T> {
    ResponseModel({
        this.data,
        this.error,
    });

    ApiResult<T>? data;
    ErrorInterceptorHandler? error;

    factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        data: json["data"] != null ? json["data"] : null ,
        error: json["error"] != null ? json["error"] : null ,
    );

    Map<String, dynamic> toJson() => {
        "data": data,
        "error": error,
    };
}
