import 'package:clutch/domain/network/model/request/phone_init_request.dart';
import 'package:clutch/domain/network/model/request/phone_sms_confirm_request.dart';
import 'package:clutch/domain/network/model/response/auth_response.dart';
import 'package:clutch/domain/network/service/api_auth_service.dart';

class MockAuthServiceImpl extends ApiAuthService {
  @override
  Future<bool> initPhone(PhoneInitRequest body) {
    // TODO: implement initPhone
    throw UnimplementedError();
  }

  @override
  Future<AuthResponse> confirmPhone(PhoneSmsConfirmRequest phoneSmsConfirmRequest) {
    // TODO: implement confirmPhone
    throw UnimplementedError();
  }
}
