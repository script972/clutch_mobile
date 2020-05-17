import 'dart:ui';

import 'package:clutch/domain/network/model/response/categories_response.dart';
import 'package:clutch/presentation/model/place_model_ui.dart';

class OfferDetailsModelUi {
  int id;
  String barcode;
  List<String> images;
  String title;
  Color color;
  CategoriesResponse categoriesResponse;
  String description;
  String phone;
  String duration;
  List<PlaceModelUi> places;

  OfferDetailsModelUi(
      this.id,
      this.barcode,
      this.images,
      this.title,
      this.color,
      this.categoriesResponse,
      this.description,
      this.phone,
      this.duration,
      this.places);
}
