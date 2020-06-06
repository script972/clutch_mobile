import 'package:clutch/presentation/model/auth_dto.dart';

abstract class AuthRepository {

  Future<bool> initPhone(String phone);

  Future<AuthDto> confirmPhone(String phone, String code);
}