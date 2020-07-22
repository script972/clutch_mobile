import 'package:clutch/domain/network/model/profile_dto.dart';
import 'package:clutch/domain/network/model/request/phone_init_request.dart';
import 'package:clutch/domain/network/model/request/phone_sms_confirm_request.dart';
import 'package:clutch/domain/network/model/response/auth_response.dart';
import 'package:clutch/domain/network/model/response/company_short_mobile.dart';
import 'package:clutch/domain/network/model/response/company_with_paid_access.dart';
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

  @override
  Future<ProfileDto> fetchProfile() {
    // TODO: implement fetchProfile
    throw UnimplementedError();
  }

  @override
  Future<ProfileDto> changeProfile(ProfileDto profileDto) {
    // TODO: implement changeProfile
    throw UnimplementedError();
  }

  @override
  Future<List<CompanyWithPaidAccess>> fetchPaidAccessDetails() {
    // TODO: implement checkPaidAccess
    throw UnimplementedError();
  }

  @override
  Future<bool> requestPaidAcessByCode(String inviteCode) {
    // TODO: implement requestPaidAcessByCode
    throw UnimplementedError();
  }
}
