
import 'package:clutch/domain/network/model/profile_dto.dart';
import 'package:clutch/domain/network/model/request/phone_init_request.dart';
import 'package:clutch/domain/network/model/request/phone_sms_confirm_request.dart';
import 'package:clutch/domain/network/model/response/auth_response.dart';
import 'package:clutch/domain/network/model/response/company_with_paid_access.dart';
import 'package:clutch/domain/network/service/base_api_serivce.dart';

abstract class ApiAuthService extends BaseApiService {

  Future<bool> initPhone(PhoneInitRequest body);

  Future<AuthResponse> confirmPhone(PhoneSmsConfirmRequest phoneSmsConfirmRequest);

  Future<ProfileDto> fetchProfile();

  Future<ProfileDto> changeProfile(ProfileDto profileDto);

  Future<List<CompanyWithPaidAccess>> fetchPaidAccessDetails();

  Future<bool> requestPaidAcessByCode(String inviteCode);

  Future<bool> requestEmail(String email);

  Future<bool> requestEmailCodeVerified(String emailCode);

}
