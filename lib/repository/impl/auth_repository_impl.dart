import 'package:clutch/domain/network/model/request/phone_init_request.dart';
import 'package:clutch/domain/network/model/request/phone_sms_confirm_request.dart';
import 'package:clutch/domain/network/service/api_auth_service.dart';
import 'package:clutch/domain/network/service_connector_factory.dart';
import 'package:clutch/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final ApiAuthService apiService = ServiceConnectorFactory.getAPIService(
      serviceType: ServiceClientEnum.AUTH);

  @override
  Future<bool> initPhone(String phone) {
    apiService.initPhone(PhoneInitRequest(phone: phone, debug: true));
  }

  @override
  Future<bool> confirmPhone(String phone, String code) {
    apiService
        .confirmPhone(PhoneSmsConfirmRequest(phone: phone, smscode: code));
  }
}
