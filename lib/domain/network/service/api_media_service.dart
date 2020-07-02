import 'dart:io';

import 'package:clutch/domain/network/service/base_api_serivce.dart';

abstract class ApiMediaService extends BaseApiService {
  Future<bool> uploadImage(File file);
}
