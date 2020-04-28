
import 'package:clutch/domain/network/model/response/company_response.dart';

abstract class CompanyRepository {
  Stream<List<CompanyResponse>> fetchAllCompany();
}