import 'package:clutch/domain/network/http_manager.dart';
import 'package:clutch/domain/network/model/response/offer_details_response.dart';
import 'package:clutch/domain/network/service/api_offer_service.dart';
import 'package:dio/dio.dart';

class HttpOfferServiceImpl extends ApiOfferService {
  @override
  Future<OfferDetailsResponse> fetchOffer(int id) async {
    Response response =
        await HttpManager().dio.get("/proposition/mobile/details/${id}");
    OfferDetailsResponse mainInfo = OfferDetailsResponse.fromMap(response.data);
    return mainInfo;
  }
}
