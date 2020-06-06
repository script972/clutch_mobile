abstract class AuthRepository {

  Future<bool> initPhone(String phone);

  Future<bool> confirmPhone(String phone, String code);
}