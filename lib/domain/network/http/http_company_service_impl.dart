import 'dart:convert';

import 'package:clutch/domain/network/api_service.dart';
import 'package:clutch/domain/network/http_manager.dart';
import 'package:clutch/domain/network/model/request/company_and_offers_search.dart';
import 'package:clutch/domain/network/model/response/main_info_response.dart';
import 'package:dio/dio.dart';

class HttpCompanyServiceImpl extends ApiCompanyService {
  @override
  Future<MainInfo> fetchCompany(CompanyAndOffersSearch body) async {
    Response response =
        await HttpManager().dio.post("company/for-me", data: body.toJson());
    MainInfo mainInfo = MainInfo.fromMap(response.data);
    return mainInfo;
  }
}
