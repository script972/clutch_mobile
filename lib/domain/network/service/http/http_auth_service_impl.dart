import 'dart:convert';

import 'package:clutch/domain/network/http_manager.dart';
import 'package:clutch/domain/network/model/profile_dto.dart';
import 'package:clutch/domain/network/model/request/phone_init_request.dart';
import 'package:clutch/domain/network/model/request/phone_sms_confirm_request.dart';
import 'package:clutch/domain/network/model/response/auth_response.dart';
import 'package:clutch/domain/network/model/response/company_short_mobile.dart';
import 'package:clutch/domain/network/service/api_auth_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class HttpAuthServiceImpl extends ApiAuthService {
  @override
  Future<bool> initPhone(PhoneInitRequest body) async {
    Response response =
        await HttpManager().dioAuth.post("/initphone", data: body.toJson());
    return response.statusCode == 200;
  }

  @override
  Future<AuthResponse> confirmPhone(PhoneSmsConfirmRequest body) async {
    Response response =
        await HttpManager().dioAuth.post("/confirm-phone", data: body.toJson());
    return AuthResponse.fromMap(response.data);
  }

  @override
  Future<ProfileDto> fetchProfile() async {
    Response response = await HttpManager().dio.get("/user/profile");
    return ProfileDto.fromMap(response.data);
  }

  @override
  Future<ProfileDto> changeProfile(ProfileDto body) async {
    Response response =
        await HttpManager().dio.patch("/user/profile", data: body.toJson());
    return ProfileDto.fromMap(response.data);
  }

  @override
  Future<List<CompanyShortMobile>> checkPaidAccess() async {
    debugPrint("<DATA<<<<");
    try {
      Response response =
          await HttpManager().dio.get("/company/check-paid-access");
      if (response.statusCode == 400) {
        return [];
      }
      debugPrint("<DATA<<<<${response.data}");
      final parsed = json.decode(response.data).cast<Map<String, dynamic>>();
      return parsed
          .map<CompanyShortMobile>((json) => CompanyShortMobile.fromJson(json))
          .toList();
    } catch (e) {
      return [];
    }
  }
}
