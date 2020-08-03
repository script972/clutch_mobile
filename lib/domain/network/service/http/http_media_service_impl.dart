import 'dart:io';

import 'package:clutch/domain/network/http_manager.dart';
import 'package:clutch/domain/network/service/api_media_service.dart';
import 'package:dio/dio.dart';

class HttpMediaServiceImpl extends ApiMediaService {
  @override
  Future<bool> uploadImage(File file) async {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(file.path, filename: fileName),
    });
    Response response = await HttpManager().dio.post("/storage",
        data: formData, options: Options(contentType: 'multipart/form-data'));
    return response.statusCode == 200;
  }
}
