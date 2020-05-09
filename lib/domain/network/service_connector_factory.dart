
import 'package:clutch/domain/network/service/api_company_service.dart';
import 'package:clutch/domain/network/service/http/http_company_service_impl.dart';
import 'package:clutch/domain/network/service/mock/mock_company_service_impl.dart';
import 'package:flutter/material.dart';

enum ServiceTypeEnum { HTTP, MOCK }

enum ServiceClientEnum { USER, COMPANY, OFFERS }

class ServiceConnectorFactory {
  static ApiCompanyService getAPIService(
      {@required ServiceClientEnum serviceType,
      ServiceTypeEnum useMockedService = ServiceTypeEnum.HTTP}) {
    assert(serviceType != null);
    switch (serviceType) {
      case ServiceClientEnum.COMPANY:
        return useMockedService == ServiceTypeEnum.HTTP
            ? HttpCompanyServiceImpl()
            : MockCompanyServiceImpl();
        break;
      case ServiceClientEnum.USER:
      // TODO: Handle this case.
      // break;
      case ServiceClientEnum.OFFERS:
        // TODO: Handle this case.
        break;
    }
  }
}
