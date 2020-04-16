
import 'package:flutter_clutch_mobile/domain/network/model/response/company_response.dart';

abstract class CompanyRepository {
  Stream<List<CompanyResponse>> fetchAllCompany();
}