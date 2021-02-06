import 'package:get_it/get_it.dart';

enum Environment { SANDBOX, PROD }

class ApiClient {
  static final String SANDBOX = 'http://62.171.176.103:8080';
  static final String PROD = 'https://me.clutchdiscount.org';
  static final String BASE_ENDPOINT = '';

  static final String BASE_URL = _getBaseUrl(GetIt.instance<Environment>());

  static String _getBaseUrl(Environment buildEnvironment) {
    switch (buildEnvironment) {
      case Environment.SANDBOX:
        return SANDBOX;
      case Environment.PROD:
        return PROD;
      default:
        return PROD;
    }
  }
}
