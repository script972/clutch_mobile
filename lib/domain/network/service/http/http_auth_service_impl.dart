import 'package:clutch/domain/network/http_manager.dart';
import 'package:clutch/domain/network/model/request/phone_init_request.dart';
import 'package:clutch/domain/network/model/request/phone_sms_confirm_request.dart';
import 'package:clutch/domain/network/service/api_auth_service.dart';
import 'package:dio/dio.dart';

class HttpAuthServiceImpl extends ApiAuthService {
  @override
  Future<bool> initPhone(PhoneInitRequest body) async {
    Response response =
        await HttpManager().dioAuth.post("/initphone", data: body.toJson());
    return response.statusCode == 200;
  }

  @override
  Future<bool> confirmPhone(PhoneSmsConfirmRequest body) async {
    Response response =
        await HttpManager().dioAuth.post("/confirm-phone", data: body.toJson());
    return response.statusCode == 200;
  }
}
