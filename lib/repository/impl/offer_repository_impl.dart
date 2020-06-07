import 'package:clutch/domain/mapper/point_mapper.dart';
import 'package:clutch/domain/network/model/response/categories_response.dart';
import 'package:clutch/domain/network/model/response/offer_details_response.dart';
import 'package:clutch/domain/network/service/api_offer_service.dart';
import 'package:clutch/domain/network/service/http/http_offer_service_impl.dart';
import 'package:clutch/presentation/model/offer_details_model_ui.dart';
import 'package:clutch/repository/offer_repository.dart';
import 'package:flutter/material.dart';

class OfferRepositoryImpl extends OfferRepository {
  ApiOfferService apiService = HttpOfferServiceImpl();

  @override
  Future<OfferDetailsModelUi> fetchCompanyById(int id) async {
    OfferDetailsResponse responseOffer = await apiService.fetchOffer(id);
    //TODO: server change for getting |duration
    Color color = Colors.red;
    String barcode = "";
    String duration = "";
    return OfferDetailsModelUi(
      responseOffer.id,
      barcode,
      responseOffer.images,
      responseOffer.title ?? "",
      color,
      responseOffer.categoryDto,
      responseOffer.description ?? "",
      responseOffer.phoneNumber ?? "",
      duration,
      responseOffer.location
          .map((e) => PointMapper.mapperResponseToUi(e))
          .toList(),
    );
  }
}
