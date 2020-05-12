import 'package:clutch/domain/network/model/response/categories_response.dart';
import 'package:clutch/domain/network/model/response/point_short_dto.dart';
import 'package:flutter/foundation.dart';

class OfferDetailsMobileDto {
  String title;
  CategoriesResponse categories;
  List<String> images;
  String description;
  int finish;
  String contactPhone;

  PointShortDto pointShortDto;

  OfferDetailsMobileDto(this.title, this.categories, this.description,
      this.finish, this.contactPhone,
      {this.pointShortDto, this.images});
}
