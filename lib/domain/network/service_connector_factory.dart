import 'package:clutch/domain/network/api_service.dart';
import 'package:clutch/domain/network/http/http_service_impl.dart';
import 'package:clutch/domain/network/mock/mock_service_impl.dart';

enum ServiceTypeEnum {HTTP, MOCK }

class ServiceConnectorFactory {
  static ApiCompanyService getAPIService({useMockedService = false}) {
    var type = ServiceTypeEnum.HTTP;
    switch (type) {
      case ServiceTypeEnum.HTTP:
        return HttpCompanyServiceImpl();
        break;
      case ServiceTypeEnum.MOCK:
        return MockCompanyServiceImpl();
        break;
    }
  }
}
