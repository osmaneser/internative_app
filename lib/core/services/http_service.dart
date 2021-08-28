import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:internative_app/core/models/api_result.dart';
import '../configs/app_config.dart';

class HttpService {
  Dio dio = Dio();

  HttpService() {
    print("HttpService Init");
    initInterceptor();
  }

  late String contentTypeHeader;
  Future<void> initInterceptor() async {
    try {
      this.dio = Dio();

      dio.interceptors.add(
        InterceptorsWrapper(
          onError: (e, handler) {
            print(e);
            print(handler);
            return handler.next(e);
          },
          onRequest: (RequestOptions options, handler) async {
            Map<String, String> headers = {
              HttpHeaders.contentTypeHeader: "application/json",
            };

            String token =
                "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOiI2MTI3NTRkZDRhMWMyZDM0NmNmZDk0NmQiLCJmdWxsTmFtZSI6IkVyZW4gS2F5YSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlVzZXIiLCJuYmYiOjE2MzAxMDUwMTksImV4cCI6MTYzMjY5NzAxOSwiaXNzIjoiaSIsImF1ZCI6ImEifQ.yu6lkJNssi9Gs6aG0GC4rRGVs4jM-uXm4rCpX2IyfkU";
            //TODO: Token işlemlerini düzelt
            if (token != null && token.isNotEmpty) {
              options.headers = headers;
              if (token.isNotEmpty) {
                options.headers["Authorization"] = "Bearer $token";
              }
            }
            return handler.next(options);
          },
        ),
      );
    } catch (e) {
      print("Beklenmedik bir hata oluştu.");
      print(e);
    }
  }

  Future<ApiResult<dynamic>> httpGet<T>({required String url}) async {
    final result = await this.dio.get(AppConfig.baseUrl + url);
    return ApiResult.fromJson(result.data);
  }

  Future<ApiResult<dynamic>> httpPost({required String url, required dynamic data}) async {
    final result = await this.dio.post(AppConfig.baseUrl + url, data: data);
    return ApiResult.fromJson(result.data);
  }
}
