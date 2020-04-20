

import 'model/response/company_response.dart';

abstract class ApiCompanyService {

  Stream<List<CompanyResponse>> fetchCompany();
}

