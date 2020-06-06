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
}
