import 'package:clutch/domain/network/model/request/company_and_offers_search.dart';
import 'package:clutch/domain/network/model/response/main_info_response.dart';
import 'package:clutch/domain/network/service/api_company_service.dart';
import 'package:clutch/domain/network/service_connector_factory.dart';
import 'package:clutch/repository/company_repository.dart';

/**
 * На этом слое вы решаете откуда тянуть данные. К примеру с локальной баы данных либо сети либо же с переферии устройства.
 * Так как базы у нас нет, будем тянуть все с сети. Далее добавим базу
 */
class CompanyRepositoryImpl extends CompanyRepository {
  final ApiCompanyService apiService = ServiceConnectorFactory.getAPIService(
      serviceType: ServiceClientEnum.COMPANY);

  @override
  Future<MainInfo> fetchAllCompany(CompanyAndOffersSearch body) {
    return apiService.fetchCompany(body);
  }
}
