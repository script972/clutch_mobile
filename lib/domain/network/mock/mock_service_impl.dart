import 'package:flutter/material.dart';
import 'package:flutter_clutch_mobile/domain/network/api_service.dart';
import 'package:flutter_clutch_mobile/domain/network/model/response/company_response.dart';


class MockCompanyServiceImpl extends ApiCompanyService {
  @override
  Stream<List<CompanyResponse>> fetchCompany() async* {
    var company = <CompanyResponse>[];
    company.add(CompanyResponse(
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
        6, "puma", "assets/images/logos/puma.png", Colors.black));
    yield company;
  }


}
