import 'package:clutch/domain/network/model/response/offer_details_response.dart';
import 'package:clutch/domain/network/service/base_api_serivce.dart';

abstract class ApiOfferService  extends BaseApiService{
  Future<OfferDetailsResponse> fetchOffer(int id);
}
