import 'dart:io';

import 'package:clutch/domain/network/model/profile_dto.dart';
import 'package:clutch/domain/network/model/request/phone_init_request.dart';
import 'package:clutch/domain/network/model/request/phone_sms_confirm_request.dart';
import 'package:clutch/domain/network/model/response/auth_response.dart';
import 'package:clutch/domain/network/model/response/company_short_mobile.dart';
import 'package:clutch/domain/network/model/response/company_with_paid_access.dart';
import 'package:clutch/domain/network/service/api_auth_service.dart';
import 'package:clutch/domain/network/service/api_media_service.dart';
import 'package:clutch/domain/network/service_connector_factory.dart';
import 'package:clutch/presentation/model/auth_dto.dart';
import 'package:clutch/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final ApiAuthService apiService = ServiceConnectorFactory.getAPIService(
      serviceType: ServiceClientEnum.AUTH);

  final ApiMediaService mediaApiService = ServiceConnectorFactory.getAPIService(
      serviceType: ServiceClientEnum.MEDIA);

  @override
  Future<bool> initPhone(String phone) {
    return apiService.initPhone(PhoneInitRequest(phone: phone, debug: true));
  }

  @override
  Future<AuthDto> confirmPhone(String phone, String code, String token) async {
    AuthResponse response = await apiService.confirmPhone(
        PhoneSmsConfirmRequest(
            phone: phone, smscode: code, firebaseToken: token));
    return AuthDto(response.accessToken, response.expiresIn);
  }

  @override
  Future<ProfileDto> fetchProfile() {
    return apiService.fetchProfile();
  }

  @override
  Future<ProfileDto> changeProfile(ProfileDto profileDto) async {
    bool uploaded = true;
    if(profileDto.facePhoto!=null){
      uploaded = false;
      File file = File(profileDto.facePhoto);
      if (profileDto.facePhoto != null)
        uploaded = await mediaApiService.uploadImage(file);
    }
    if (uploaded) {
      return await apiService.changeProfile(profileDto);
    }
    return null;
  }

  @override
  Future<List<CompanyWithPaidAccess>> fetchPaidAccessDetails() {
    return apiService.fetchPaidAccessDetails();
  }

  @override
  Future<bool> requestPaidAccessByCode(String inviteCode) {
    return apiService.requestPaidAcessByCode(inviteCode);
  }

  @override
  Future<bool> requestEmail(String email) {
    return apiService.requestEmail(email);
  }

  @override
  Future<bool> requestEmailCodeVerified(String emailCode) {
    return apiService.requestEmailCodeVerified(emailCode);
  }
}
