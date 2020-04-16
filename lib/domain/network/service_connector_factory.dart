

import 'package:flutter_clutch_mobile/domain/network/api_service.dart';
import 'package:flutter_clutch_mobile/domain/network/firestore/firestore_service_impl.dart';
import 'package:flutter_clutch_mobile/domain/network/http/http_service_impl.dart';
import 'package:flutter_clutch_mobile/domain/network/mock/mock_service_impl.dart';

enum ServiceTypeEnum { FIRESTORE, HTTP, MOCK }

class ServiceConnectorFactory {
  static ApiService getAPIService({useMockedService = false}) {
    var type = ServiceTypeEnum.FIRESTORE;
    switch (type) {
      case ServiceTypeEnum.FIRESTORE:
        return FirestoreServiceImpl();
        break;
      case ServiceTypeEnum.HTTP:
        return HttpServiceImpl();
        break;
      case ServiceTypeEnum.MOCK:
        return MockServiceImpl();
        break;
    }
  }
}
