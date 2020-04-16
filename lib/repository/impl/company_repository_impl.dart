import 'package:flutter_clutch_mobile/domain/network/api_service.dart';
import 'package:flutter_clutch_mobile/domain/network/model/response/company_response.dart';
import 'package:flutter_clutch_mobile/domain/network/service_connector_factory.dart';
import 'package:flutter_clutch_mobile/repository/company_repository.dart';

/**
 * На этом слое вы решаете откуда тянуть данные. К примеру с локальной баы данных либо сети.
 * Так как базы у нас нет, будем тянуть все с сети.
 */
class CompanyRepositoryImpl extends CompanyRepository {

  final ApiService apiService = ServiceConnectorFactory.getAPIService();

  @override
  Stream<List<CompanyResponse>> fetchAllCompany() {
    return apiService.fetchCompany();
  }
}
