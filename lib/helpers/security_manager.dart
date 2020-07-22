import 'package:clutch/domain/network/model/response/company_with_paid_access.dart';
import 'package:clutch/domain/repository/auth_repository.dart';
import 'package:clutch/domain/repository/impl/auth_repository_impl.dart';
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

  static Future<bool> checkPaidAccess() async {
    AuthRepository authRepository = AuthRepositoryImpl();
    List<CompanyWithPaidAccess> companyList =
        await authRepository.fetchPaidAccessDetails();
    bool fullAccess = false;
    companyList.forEach((element) {
      if (!element.verifyViaEmailOrAdmin) {
        fullAccess = true;
        return fullAccess;
      } else {
        //:TODO check on code email or admin
      }
    });
    return fullAccess;
  }
}
