import 'package:clutch/domain/mapper/point_mapper.dart';
import 'package:clutch/domain/network/service/api_offer_service.dart';
import 'package:clutch/domain/network/service/http/http_offer_service_impl.dart';
import 'package:clutch/domain/repository/offer_repository.dart';
import 'package:clutch/helpers/utils/date_utils.dart';
import 'package:clutch/presentation/model/offer_details_model_ui.dart';
import 'package:clutch/ui/localization/keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/global.dart';

class OfferRepositoryImpl extends OfferRepository {
  ApiOfferService apiService = HttpOfferServiceImpl();

  @override
  Future<OfferDetailsModelUi> fetchCompanyById(int id) async {
    var responseOffer = await apiService.fetchOffer(id);
    Color color = Colors.red;
    var duration = '';
    if (responseOffer.perpetual) {
      duration = translate(Keys.Perpetual);
    } else {
      var dateStart;
      if (responseOffer.startDate != null) {
        dateStart =
            DateTime.fromMillisecondsSinceEpoch(responseOffer.startDate);
      }
      var dateEnd;
      if (responseOffer.endDate != null) {
        dateEnd = DateTime.fromMillisecondsSinceEpoch(responseOffer.endDate);
      }
      if (dateStart != null && dateEnd != null) {
        duration =
            '${translate(Keys.Offer_Work_Since)} ${DateUtils.dayMonthInString(dateStart)} ${translate(Keys.To)} ${DateUtils.dayMonthInString(dateEnd)}';
      }
    }

    return OfferDetailsModelUi(
      responseOffer.id,
      responseOffer.barcode,
      responseOffer.images,
      responseOffer.title ?? '',
      color,
      responseOffer.companyShortMobile,
      responseOffer.categoryDto,
      responseOffer.description ?? '',
      responseOffer.phoneNumber ?? '',
      duration,
      responseOffer.location
          .map((e) => PointMapper.mapperResponseToUi(e))
          .toList(),
    );
  }
}
