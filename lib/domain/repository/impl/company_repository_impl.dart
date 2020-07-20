import 'package:clutch/domain/network/model/request/company_and_offers_search.dart';
import 'package:clutch/domain/network/model/response/company_details_response.dart';
import 'package:clutch/domain/network/model/response/main_info_response.dart';
import 'package:clutch/domain/network/service/api_company_service.dart';
import 'package:clutch/domain/network/service_connector_factory.dart';
import 'package:clutch/domain/repository/company_repository.dart';

class CompanyRepositoryImpl extends CompanyRepository {
  final ApiCompanyService apiService = ServiceConnectorFactory.getAPIService(
      serviceType: ServiceClientEnum.COMPANY);

  @override
  Future<MainInfo> fetchAllCompany(CompanyAndOffersSearch body) {
    return apiService.fetchCompany(body);
  }

  @override
  Future<CompanyDetailsResponse> fetchCompanyDetails(int id) {
    return apiService.fetchDetailsCompany(id);
  }
}
