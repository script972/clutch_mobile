import 'package:clutch/domain/network/model/request/company_and_offers_search.dart';
import 'package:clutch/domain/network/model/response/company_short_mobile.dart';
import 'package:clutch/domain/network/model/response/main_info_response.dart';

abstract class CompanyRepository {
  Future<MainInfo> fetchAllCompany(CompanyAndOffersSearch body);
}
