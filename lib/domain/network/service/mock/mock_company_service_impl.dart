import 'package:clutch/domain/network/model/request/company_and_offers_search.dart';
import 'package:clutch/domain/network/model/response/company_short_mobile.dart';
import 'package:clutch/domain/network/model/response/main_info_response.dart';
import 'package:clutch/domain/network/service/api_company_service.dart';

class MockCompanyServiceImpl extends ApiCompanyService {
  @override
  Future<MainInfo> fetchCompany(CompanyAndOffersSearch body) async {
    var company = <CompanyShortMobile>[];
    /* company.add(CompanyResponse(
        1, "foxtrot", "assets/images/logos/foxtrot.png", Color(0xFFFE5000)));
    company.add(CompanyResponse(
        2, "adidas", "assets/images/logos/adidas.png", Colors.white));
    company.add(CompanyResponse(
        3, "adidas", "assets/images/logos/turkishairlines.png", Colors.white));
    company.add(CompanyResponse(
        4, "reebok", "assets/images/logos/reebok.png", Color(0xFF0074CD)));
    company.add(CompanyResponse(
        5, "answear", "assets/images/logos/answear.png", Color(0xFFF1B1C8)));
    company.add(CompanyResponse(
        6, "puma", "assets/images/logos/puma.png", Colors.black));*/
    //yield company;
  }
}
