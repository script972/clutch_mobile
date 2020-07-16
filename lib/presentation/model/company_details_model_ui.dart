import 'dart:ui';

import 'package:clutch/domain/network/model/response/anchor_proposition_response.dart';
import 'package:clutch/domain/network/model/response/categories_response.dart';
import 'package:clutch/presentation/model/place_model_ui.dart';
import 'package:clutch/presentation/model/short_offer_model_ui.dart';

class CompanyDetailsModelUi {
  int id;
  String logoUrl;
  String barcode;
  String title;
  Color color;
  CategoriesResponse categoriesResponse;
  String description;
  String site;
  String facebookUrl;
  String instargamUrl;
  String phone;


  AnchorPropositionResponse anchorPropositionResponse;
  List<PlaceModelUi> places;
  List<ShortOfferModelUi> offers;

  CompanyDetailsModelUi(this.id, this.logoUrl, this.barcode, this.title, this.site, this.phone,
      this.color, this.categoriesResponse, this.description, this.places, this.offers, this.anchorPropositionResponse, this.facebookUrl, this.instargamUrl);


}
