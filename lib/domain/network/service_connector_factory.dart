import 'package:clutch/domain/network/service/api_company_service.dart';
import 'package:clutch/domain/network/service/base_api_serivce.dart';
import 'package:clutch/domain/network/service/http/http_auth_service_impl.dart';
import 'package:clutch/domain/network/service/http/http_company_service_impl.dart';
import 'package:clutch/domain/network/service/mock/mock_auth_service.dart';
import 'package:clutch/domain/network/service/mock/mock_company_service_impl.dart';
import 'package:flutter/material.dart';

enum ServiceTypeEnum { HTTP, MOCK }

enum ServiceClientEnum { USER, COMPANY, OFFERS, AUTH }

class ServiceConnectorFactory {
  static BaseApiService getAPIService(
      {@required ServiceClientEnum serviceType,
      ServiceTypeEnum useMockedService = ServiceTypeEnum.HTTP}) {
    assert(serviceType != null);

    switch (serviceType) {
      case ServiceClientEnum.COMPANY:
        return useMockedService == ServiceTypeEnum.HTTP
            ? HttpCompanyServiceImpl()
            : MockCompanyServiceImpl();
        break;
      case ServiceClientEnum.AUTH:
        return useMockedService == ServiceTypeEnum.HTTP
            ? HttpAuthServiceImpl()
            : MockAuthServiceImpl();
      case ServiceClientEnum.USER:
      // TODO: Handle this case.
      // break;
      case ServiceClientEnum.OFFERS:
        // TODO: Handle this case.
        break;
    }
  }
}
