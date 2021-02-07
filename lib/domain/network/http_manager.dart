import 'dart:convert';

import 'package:clutch/core/custom_route.dart';
import 'package:clutch/domain/network/api_client.dart';
import 'package:clutch/helpers/navigation_service.dart';
import 'package:clutch/helpers/security_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HttpManager {
  static final HttpManager _singleton = HttpManager._internal();

  factory HttpManager() {
    return _singleton;
  }

  HttpManager._internal();

  final JsonDecoder _decoder = JsonDecoder();

  dynamic decodeResp(d) {
    var response = d as Response;
    final dynamic jsonBody = response.data;
    final statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || jsonBody == null) {
      throw Exception('statusCode: $statusCode');
    }

    if (jsonBody is String) {
      return _decoder.convert(jsonBody);
    } else {
      return jsonBody;
    }
  }

  Dio get dioAuth {
    var dio = Dio();
    dio.options.baseUrl = ApiClient.BASE_URL + '/auth';
    dio.options.connectTimeout = 20000;
    dio.options.receiveTimeout = 20000;
    dio.options.responseType = ResponseType.json;
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      /*String token = await SharedPreferencesHelper.loadToken();
      if (token != null) {
        options.headers["Authorization"] = "Bearer " + token;
      }*/
      return options;
    }, onResponse: (Response response) async {
      return response;
    }, onError: (onError) {
      debugPrint('OnError');
    }));
    return dio;
  }

  Dio get dio {
    var dio = Dio();
    dio.options.baseUrl = ApiClient.BASE_URL + '/api';
    dio.options.connectTimeout = 20000;
    dio.options.receiveTimeout = 20000;
    dio.options.responseType = ResponseType.json;

    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      var token = await SecurityManager.fetchToken();
      if (token != null) {
        options.headers['Authorization'] = 'Bearer ' + token;
      }
      return options;
    }, onError: (dioError) {
      if (dioError.response.statusCode == 401) {
        GetIt.instance<NavigationService>()
            .navigateTo(CustomRoute.SIGNIN_PHONE_SCREEN);
      }
      return dioError;
    }, onResponse: (Response response) async {
      return response;
    }));
    return dio;
  }
}
