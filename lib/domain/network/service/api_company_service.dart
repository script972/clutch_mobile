import 'package:clutch/domain/network/model/request/company_and_offers_search.dart';
import 'package:clutch/domain/network/model/response/main_info_response.dart';

abstract class ApiCompanyService {
  Future<MainInfo> fetchCompany(CompanyAndOffersSearch body);
}
