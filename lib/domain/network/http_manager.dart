import 'dart:convert';

import 'package:alice/alice.dart';
import 'package:clutch/core/custom_route.dart';
import 'package:clutch/domain/network/api_client.dart';
import 'package:clutch/helpers/security_manager.dart';
import 'package:clutch/helpers/utils/shared_preferences_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';

class HttpManager {
  static final HttpManager _singleton = new HttpManager._internal();

  factory HttpManager() {
    return _singleton;
  }

  HttpManager._internal();

  final JsonDecoder _decoder = new JsonDecoder();

  dynamic decodeResp(d) {
    var response = d as Response;
    final dynamic jsonBody = response.data;
    final statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || jsonBody == null) {
      throw new Exception("statusCode: $statusCode");
    }

    if (jsonBody is String) {
      return _decoder.convert(jsonBody);
    } else {
      return jsonBody;
    }
  }

  Dio get dioAuth {
    Dio dio = Dio();
    Alice alice = Alice(showNotification: true);
    dio.interceptors.add(alice.getDioInterceptor());
    dio.options.baseUrl = ApiClient.BASE_URL + "/auth";
    dio.options.connectTimeout = 20000;
    dio.options.receiveTimeout = 20000;
    dio.options.responseType = ResponseType.json;
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      /*String token = await SharedPreferencesHelper.loadToken();
      if (token != null) {
        options.headers["Authorization"] = "Bearer " + token;
      }*/
      debugPrint("<<<<<<REQUEST=${options}");
      return options;
    }, onResponse: (Response response) async {
      debugPrint("<<<<<<RESPONSE=${response}");
      return response;
    }));
    return dio;
  }


  Dio get dio {
    Dio dio = Dio();
    Alice alice = Alice(showNotification: true);
    dio.interceptors.add(alice.getDioInterceptor());
    dio.options.baseUrl = ApiClient.BASE_URL + "/api";
    dio.options.connectTimeout = 20000;
    dio.options.receiveTimeout = 20000;
    dio.options.responseType = ResponseType.json;

    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      String token = await SecurityManager.fetchToken();
      if (token != null) {
        options.headers["Authorization"] = "Bearer " + token;
      }
      debugPrint("<<<<<<REQUEST=${options}");
      return options;
    }, onResponse: (Response response) async {
      debugPrint("<<<<<<RESPONSE=${response}");
      if(response.statusCode==401){
        //TODO: navigate on Auth screen
      }
      return response;
    }));
    return dio;
  }
}