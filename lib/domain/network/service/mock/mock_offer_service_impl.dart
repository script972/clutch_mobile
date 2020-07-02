import 'package:clutch/domain/network/model/response/offer_details_response.dart';
import 'package:clutch/domain/network/service/api_offer_service.dart';

class MockOfferServiceImpl extends ApiOfferService {

  @override
  Future<OfferDetailsResponse> fetchOffer(int id) {
    // TODO: implement fetchOffer
    throw UnimplementedError();
  }
}
