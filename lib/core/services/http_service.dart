import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:internative_app/core/configs/global_constants.dart';
import 'package:internative_app/core/enums/error_page_type.dart';
import 'package:internative_app/core/models/api_result.dart';
import 'package:internative_app/core/reusuable_widgets/error_pages/error_page.dart';
import 'package:internative_app/init/locator.dart';
import 'package:internative_app/ui/modules/auth/sign_in/sign_in_page.dart';
import 'package:internative_app/ui/modules/auth/sign_in/sign_in_view_model.dart';
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
            final code = e.response!.statusCode;

            switch (code) {
              case HttpStatus.badRequest:
                GlobalConstants.navigatorKey!.currentState!
                    .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => SignInPage()), (route) => false);
                break;
              case HttpStatus.unauthorized:
              GlobalConstants.navigatorKey!.currentState!
                .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => OeErrorPage(pageType: ErrorPageType.Unauthorized,)), (route) => false);
                break;
              case HttpStatus.notFound:
              GlobalConstants.navigatorKey!.currentState!
                .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => SignInPage()), (route) => false);
                break;
              default:
            }
            return handler.next(e);
          },
          onRequest: (RequestOptions options, handler) async {
            Map<String, String> headers = {
              HttpHeaders.contentTypeHeader: "application/json",
            };
            final vModelAuth = locator<SignInViewModel>();
            if (vModelAuth.boxAuth != null) {
              String token = vModelAuth.boxAuth!.get("token");
              if (token.isNotEmpty) {
                options.headers = headers;
                if (token.isNotEmpty) {
                  options.headers["Authorization"] = "Bearer $token";
                }
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
