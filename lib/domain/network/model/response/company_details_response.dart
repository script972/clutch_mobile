import 'dart:convert';

import 'package:clutch/domain/network/model/response/offers_short_mobile_dto.dart';
import 'package:clutch/domain/network/model/response/point_short_dto.dart';

class CompanyDetailsResponse {
  final int id;
  final String barcode;
  final String logo;
  final String color;
  final bool justOnline;
  final String title;
  final String categories;
  final double rang;
  final String description;
  final String site;
  final String phone;
  final List<OffersShortMobileDto> offersShortMobileDtoList;
  final List<PointShortDto> pointShortMobileDtoList;

  CompanyDetailsResponse({
    this.id,
    this.barcode,
    this.logo,
    this.color,
    this.justOnline,
    this.title,
    this.categories,
    this.rang,
    this.description,
    this.site,
    this.phone,
    this.offersShortMobileDtoList,
    this.pointShortMobileDtoList,
  });

  factory CompanyDetailsResponse.fromJson(String str) =>
      CompanyDetailsResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CompanyDetailsResponse.fromMap(Map<String, dynamic> json) =>
      CompanyDetailsResponse(
        id: json["id"],
        barcode: json["barcode"],
        logo: json["logo"],
        color: json["color"],
        justOnline: json["justOnline"],
        title: json["title"],
        categories: json["categories"],
        rang: json["rang"],
        description: json["description"],
        site: json["site"],
        phone: json["phone"],
        offersShortMobileDtoList: List<OffersShortMobileDto>.from(
            json["offersShortMobileDtoList"]
                .map((x) => OffersShortMobileDto.fromMap(x))),
        pointShortMobileDtoList: List<PointShortDto>.from(
            json["pointShortMobileDtoList"]
                .map((x) => PointShortDto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "barcode": barcode,
        "logo": logo,
        "color": color,
        "justOnline": justOnline,
        "title": title,
        "categories": categories,
        "rang": rang,
        "description": description,
        "site": site,
        "phone": phone,
        "offersShortMobileDtoList":
            List<dynamic>.from(offersShortMobileDtoList.map((x) => x.toMap())),
        "pointShortMobileDtoList":
            List<dynamic>.from(pointShortMobileDtoList.map((x) => x.toMap())),
      };
}
