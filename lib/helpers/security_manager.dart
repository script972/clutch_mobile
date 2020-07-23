import 'package:clutch/core/custom_route.dart';
import 'package:clutch/domain/model/lunch_security_checker_dto.dart';
import 'package:clutch/domain/network/model/response/company_with_paid_access.dart';
import 'package:clutch/domain/network/model/response/verified_type.dart';
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

  static Future<LunchSecurityCheckerDto> checkPaidAccess() async {
    LunchSecurityCheckerDto out = LunchSecurityCheckerDto();
    out.hasAccess=false;
    out.screen = CustomRoute.EMAIL_VERIFIED_SCREEN;
    AuthRepository authRepository = AuthRepositoryImpl();
    List<CompanyWithPaidAccess> companyList =
        await authRepository.fetchPaidAccessDetails();
    companyList.forEach((element) {
      if (!element.verifyViaEmailOrAdmin) {
        out.hasAccess=true;
        out.screen = CustomRoute.MAIN_SCREEN;
        return out;
      } else {
        if (element.verifiedType == VerifiedType.ADMIN ||
            element.verifiedType == VerifiedType.EMAIL) {
          out.hasAccess=true;
          out.screen = CustomRoute.MAIN_SCREEN;
          return out;
        }
      }
    });
    return out;
  }
}
