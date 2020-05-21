import 'package:clutch/domain/network/model/response/offers_short_mobile_dto.dart';
import 'package:clutch/presentation/model/short_offer_model_ui.dart';

class OfferMapper {
  static ShortOfferModelUi mapperShortResponseToUi(OffersShortMobileDto input) {
    return ShortOfferModelUi(input.id, input.image, input.title, "");
  }
}
