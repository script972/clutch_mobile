import 'package:clutch/domain/network/model/request/phone_init_request.dart';
import 'package:clutch/domain/network/model/request/phone_sms_confirm_request.dart';
import 'package:clutch/domain/network/model/response/auth_response.dart';
import 'package:clutch/domain/network/service/api_auth_service.dart';
import 'package:clutch/domain/network/service_connector_factory.dart';
import 'package:clutch/presentation/model/auth_dto.dart';
import 'package:clutch/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final ApiAuthService apiService = ServiceConnectorFactory.getAPIService(
      serviceType: ServiceClientEnum.AUTH);

  @override
  Future<bool> initPhone(String phone) {
    return apiService.initPhone(PhoneInitRequest(phone: phone, debug: true));
  }

  @override
  Future<AuthDto> confirmPhone(String phone, String code) async {
    AuthResponse response = await apiService
        .confirmPhone(PhoneSmsConfirmRequest(phone: phone, smscode: code));
    return AuthDto(response.accessToken, response.expiresIn);
  }
}
