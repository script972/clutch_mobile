import 'package:clutch/domain/model/exception/http_exceptions.dart';
import 'package:clutch/domain/network/http_manager.dart';
import 'package:clutch/domain/network/model/profile_dto.dart';
import 'package:clutch/domain/network/model/request/phone_init_request.dart';
import 'package:clutch/domain/network/model/request/phone_sms_confirm_request.dart';
import 'package:clutch/domain/network/model/response/auth_response.dart';
import 'package:clutch/domain/network/model/response/company_with_paid_access.dart';
import 'package:clutch/domain/network/service/api_auth_service.dart';
import 'package:clutch/ui/localization/keys.dart';
import 'package:dio/dio.dart';

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
  Future<List<CompanyWithPaidAccess>> fetchPaidAccessDetails() async {
    try {
      Response response =
          await HttpManager().dio.get("/company/details-paid-access");
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
    Response response =
        await HttpManager().dio.get("/become-paid-access/{${inviteCode}");
    return response.statusCode == 200;
  }

  @override
  Future<bool> requestEmail(String email) async {
    var response = await HttpManager().dio.get("/request-access-via-email");
    if (response.statusCode == 200) return true;
    if (response.statusCode == 404) {
      throw HttpExceptions(Keys.Email_Doest_Not_Support);
    }
    if (response.statusCode == 400) {
      throw HttpExceptions(Keys.Invalid_Email);
    }
  }

  @override
  Future<bool> requestEmailCodeVerified(String emailCode) async {
    var response =
        await HttpManager().dio.get("/request-access-verify-code-email");
    if (response.statusCode == 200) return true;
    /*if (response.statusCode == 404) {
      throw HttpExceptions(Keys.Email_Doest_Not_Support);
    }
    if (response.statusCode == 400) {
      throw HttpExceptions(Keys.Invalid_Email);
    }*/
  }
}
