import 'package:clutch/domain/network/model/response/offer_details_response.dart';

abstract class ApiOfferService {
  Future<OfferDetailsResponse> fetchOffer(int id);
}
