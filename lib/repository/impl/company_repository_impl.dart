import 'package:flutter_clutch_mobile/domain/network/api_service.dart';
import 'package:flutter_clutch_mobile/domain/network/model/response/company_response.dart';
import 'package:flutter_clutch_mobile/domain/network/service_connector_factory.dart';
import 'package:flutter_clutch_mobile/repository/company_repository.dart';

/**
 * На этом слое вы решаете откуда тянуть данные. К примеру с локальной баы данных либо сети либо же с переферии устройства.
 * Так как базы у нас нет, будем тянуть все с сети. Далее добавим базу
 */
class CompanyRepositoryImpl extends CompanyRepository {

  final ApiCompanyService apiService = ServiceConnectorFactory.getAPIService();

  @override
  Stream<List<CompanyResponse>> fetchAllCompany() {
   /*
   TODO: Заменить в сооветсвии с логикой
   if(database.getAllCompany().isNotEmpty && database.getAllCompany().isActual()) {
      return database.getData();
    } else {
      var data = apiService.fetchCompany();
      database.saveAllCompany(data);
      return data;
    }*/
    return apiService.fetchCompany();
  }
}
