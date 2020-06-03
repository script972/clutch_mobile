import 'package:clutch/domain/network/model/request/company_and_offers_search.dart';
import 'package:clutch/domain/network/model/response/company_details_response.dart';
import 'package:clutch/domain/network/model/response/main_info_response.dart';

abstract class CompanyRepository {
  Future<MainInfo> fetchAllCompany(CompanyAndOffersSearch body);

  Future<CompanyDetailsResponse> fetchCompanyDetails(int id);
}
