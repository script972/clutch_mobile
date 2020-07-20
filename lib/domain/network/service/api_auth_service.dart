
import 'package:clutch/domain/network/model/profile_dto.dart';
import 'package:clutch/domain/network/model/request/phone_init_request.dart';
import 'package:clutch/domain/network/model/request/phone_sms_confirm_request.dart';
import 'package:clutch/domain/network/model/response/auth_response.dart';
import 'package:clutch/domain/network/model/response/company_short_mobile.dart';
import 'package:clutch/domain/network/service/base_api_serivce.dart';
import 'package:dio/dio.dart';

abstract class ApiAuthService extends BaseApiService {

  Future<bool> initPhone(PhoneInitRequest body);

  Future<AuthResponse> confirmPhone(PhoneSmsConfirmRequest phoneSmsConfirmRequest);

  Future<ProfileDto> fetchProfile();

  Future<ProfileDto> changeProfile(ProfileDto profileDto);

  Future<List<CompanyShortMobile>> checkPaidAccess();

}
