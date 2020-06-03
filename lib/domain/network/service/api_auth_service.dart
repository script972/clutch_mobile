
import 'package:clutch/domain/network/model/request/phone_init_request.dart';
import 'package:clutch/domain/network/service/base_api_serivce.dart';

abstract class ApiAuthService extends BaseApiService {

  Future<bool> initPhone(PhoneInitRequest body);

}
