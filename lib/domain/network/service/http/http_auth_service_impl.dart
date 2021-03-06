import 'package:clutch/domain/model/exception/http_exceptions.dart';
import 'package:clutch/domain/network/http_manager.dart';
import 'package:clutch/domain/network/model/profile_dto.dart';
import 'package:clutch/domain/network/model/request/phone_init_request.dart';
import 'package:clutch/domain/network/model/request/phone_sms_confirm_request.dart';
import 'package:clutch/domain/network/model/request/value_request.dart';
import 'package:clutch/domain/network/model/response/auth_response.dart';
import 'package:clutch/domain/network/model/response/company_with_paid_access.dart';
import 'package:clutch/domain/network/service/api_auth_service.dart';
import 'package:clutch/ui/localization/keys.dart';

class HttpAuthServiceImpl extends ApiAuthService {
  @override
  Future<bool> initPhone(PhoneInitRequest body) async {
    var response =
        await HttpManager().dioAuth.post('/initphone', data: body.toJson());
    return response.statusCode == 200;
  }

  @override
  Future<AuthResponse> confirmPhone(PhoneSmsConfirmRequest body) async {
    var response =
        await HttpManager().dioAuth.post('/confirm-phone', data: body.toJson());
    return AuthResponse.fromMap(response.data);
  }

  @override
  Future<ProfileDto> fetchProfile() async {
    var response = await HttpManager().dio.get('/user/profile');
    return ProfileDto.fromMap(response.data);
  }

  @override
  Future<ProfileDto> changeProfile(ProfileDto body) async {
    var response =
        await HttpManager().dio.patch('/user/profile', data: body.toJson());
    return ProfileDto.fromMap(response.data);
  }

  @override
  Future<List<CompanyWithPaidAccess>> fetchPaidAccessDetails() async {
    try {
      var response = await HttpManager().dio.get('/user/details-paid-access');
      if (response.statusCode == 400) {
        return [];
      }
      return response.data
          .map<CompanyWithPaidAccess>((i) => CompanyWithPaidAccess.fromMap(i))
          .toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<bool> requestPaidAcessByCode(String inviteCode) async {
    var request = ValueRequest()..value = inviteCode;
    try {
      var response = await HttpManager()
          .dio
          .post('/user/become-paid-access-by-code', data: request.toJson());
      return response.statusCode == 200;
    } catch (e) {
      throw HttpExceptions('todo');
    }
  }

  @override
  Future<bool> requestEmail(String email) async {
    var request = ValueRequest()..value = email;
    try {
      var response = await HttpManager()
          .dio
          .post('/user/request-access-via-email', data: request.toJson());
      if (response.statusCode == 200) return true;
    } catch (e) {
      if (e.resscrse.statusCode == 404) {
        throw HttpExceptions(Keys.Email_Doest_Not_Support);
      }
      if (e.response.statusCode == 400) {
        throw HttpExceptions(Keys.Invalid_Email);
      }
      if (e.response.statusCode == 409) {
        throw HttpExceptions(Keys.Can_Not_Send_Email);
      }
      throw HttpExceptions(Keys.Unknown_Error);
    }
    return false;
  }

  @override
  Future<bool> requestEmailCodeVerified(String emailCode) async {
    var request = ValueRequest()..value = emailCode;
    try {
      var response = await HttpManager().dio.post(
          '/user/request-access-verify-code-email',
          data: request.toJson());
      return response.statusCode == 200;
    } catch (e) {
      if (e.response.statusCode == 409) {
        throw HttpExceptions(Keys.You_Are_Alredy_Have_Company);
      }
      if (e.response.statusCode == 404) {
        throw HttpExceptions(Keys.Code_Not_Found);
      }
    }
    return false;
  }
}
