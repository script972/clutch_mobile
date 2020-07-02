import 'package:clutch/helpers/utils/shared_preferences_helper.dart';
import 'package:clutch/presentation/model/auth_dto.dart';

class SecurityManager {
  static bool proccessNewSecuriryToken(AuthDto authDto) {
    //TODO: check on expired in
    if (authDto.token?.isEmpty) return false;
    SharedPreferencesHelper.saveToken(authDto.token);
    //TODO: save expired time
    //SharedPreferencesHelper.saveExipiredTime();
    return true;
  }

  static Future<String> fetchToken() async {
    return SharedPreferencesHelper.loadToken();
  }

  static Future<bool> isAuthorize() async {
    String token = await SharedPreferencesHelper.loadToken();
    //TODO: check on token expired date and current date
    if (token == null || token.isEmpty)
      return false;
    else
      return true;
  }
}
