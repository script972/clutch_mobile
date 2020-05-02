import 'package:clutch/domain/network/model/response/company_short_mobile.dart';
import 'package:clutch/domain/network/model/response/main_info_response.dart';

abstract class CompanyRepository {
  Future<MainInfo> fetchAllCompany();
}
