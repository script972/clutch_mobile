import 'dart:ui';

import 'package:clutch/domain/network/model/response/categories_response.dart';
import 'package:clutch/presentation/model/place_model_ui.dart';

class CompanyDetailsModelUi {
  int id;
  String logoUrl;
  String barcode;
  String title;
  Color color;
  CategoriesResponse categoriesResponse;
  String description;

  List<PlaceModelUi> places;

  CompanyDetailsModelUi(this.id, this.logoUrl, this.barcode, this.title,
      this.color, this.categoriesResponse, this.description, this.places);


}
