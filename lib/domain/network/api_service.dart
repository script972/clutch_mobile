

import 'model/response/company_response.dart';

abstract class ApiService {

  Stream<List<CompanyResponse>> fetchCompany();

}
