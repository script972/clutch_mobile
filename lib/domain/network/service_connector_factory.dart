

import 'package:clutch/domain/network/api_service.dart';
import 'package:clutch/domain/network/firestore/firestore_service_impl.dart';
import 'package:clutch/domain/network/http/http_service_impl.dart';
import 'package:clutch/domain/network/mock/mock_service_impl.dart';

enum ServiceTypeEnum { FIRESTORE, HTTP, MOCK }

class ServiceConnectorFactory {
  static ApiCompanyService getAPIService({useMockedService = false}) {
    var type = ServiceTypeEnum.FIRESTORE;
    switch (type) {
      case ServiceTypeEnum.FIRESTORE:
        return FirestoreCompanyServiceImpl();
        break;
      case ServiceTypeEnum.HTTP:
        return HttpCompanyServiceImpl();
        break;
      case ServiceTypeEnum.MOCK:
        return MockCompanyServiceImpl();
        break;
    }
  }
}
