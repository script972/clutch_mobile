import 'package:clutch/domain/network/model/request/company_and_offers_search.dart';
import 'package:clutch/domain/network/model/response/company_details_response.dart';
import 'package:clutch/domain/network/model/response/main_info_response.dart';
import 'package:clutch/domain/network/service/base_api_serivce.dart';

abstract class ApiCompanyService extends BaseApiService{
  Future<MainInfo> fetchCompany(CompanyAndOffersSearch body);

  Future<CompanyDetailsResponse> fetchDetailsCompany(int id);
}
