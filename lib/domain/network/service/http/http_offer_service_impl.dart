import 'package:clutch/domain/network/http_manager.dart';
import 'package:clutch/domain/network/model/response/offer_details_response.dart';
import 'package:clutch/domain/network/service/api_offer_service.dart';

class HttpOfferServiceImpl extends ApiOfferService {
  @override
  Future<OfferDetailsResponse> fetchOffer(int id) async {
    var response =
        await HttpManager().dio.get('/proposition/mobile/details/${id}');
    var mainInfo = OfferDetailsResponse.fromMap(response.data);
    return mainInfo;
  }
}
