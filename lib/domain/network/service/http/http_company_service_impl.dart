import 'package:clutch/domain/network/http_manager.dart';
import 'package:clutch/domain/network/model/request/company_and_offers_search.dart';
import 'package:clutch/domain/network/model/response/company_details_response.dart';
import 'package:clutch/domain/network/model/response/main_info_response.dart';
import 'package:clutch/domain/network/service/api_company_service.dart';

class HttpCompanyServiceImpl extends ApiCompanyService {
  @override
  Future<MainInfo> fetchCompany(CompanyAndOffersSearch body) async {
    var response =
        await HttpManager().dio.post('/company/for-me', data: body.toJson());
    var mainInfo = MainInfo.fromMap(response.data);
    return mainInfo;
  }

  @override
  Future<CompanyDetailsResponse> fetchDetailsCompany(int id) async {
    var response = await HttpManager()
        .dio
        .get('/company/details-company-mobile/${id.toString()}');
    var companyDetails = CompanyDetailsResponse.fromMap(response.data);
    return companyDetails;
  }
}
