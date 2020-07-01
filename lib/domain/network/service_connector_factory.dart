import 'package:clutch/domain/network/service/base_api_serivce.dart';
import 'package:clutch/domain/network/service/http/http_auth_service_impl.dart';
import 'package:clutch/domain/network/service/http/http_company_service_impl.dart';
import 'package:clutch/domain/network/service/http/http_media_service_impl.dart';
import 'package:clutch/domain/network/service/mock/mock_auth_service_impl.dart';
import 'package:clutch/domain/network/service/mock/mock_company_service_impl.dart';
import 'package:clutch/domain/network/service/mock/mock_media_service_impl.dart';
import 'package:flutter/material.dart';

enum ServiceTypeEnum { HTTP, MOCK }

enum ServiceClientEnum { USER, COMPANY, OFFERS, AUTH, MEDIA }

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
      case ServiceClientEnum.MEDIA:
        return useMockedService == ServiceTypeEnum.HTTP
            ? HttpMediaServiceImpl()
            : MockMediaServiceImpl();
        break;
      case ServiceClientEnum.OFFERS:
        // TODO: Handle this case.
        break;
    }
  }
}
