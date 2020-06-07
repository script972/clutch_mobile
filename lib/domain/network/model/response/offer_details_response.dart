import 'dart:convert';

import 'package:clutch/domain/network/model/response/company_short_mobile.dart';
import 'package:clutch/domain/network/model/response/point_short_dto.dart';

class OfferDetailsResponse {
  int id;
  String title;
  String barcode;
  dynamic startDate;
  int endDate;
  String logo;
  List<String> images;
  String description;
  bool perpetual;
  String phoneNumber;
  CompanyShortMobile companyShortMobile;
  List<PointShortDto> location;

  OfferDetailsResponse({
    this.id,
    this.title,
    this.barcode,
    this.startDate,
    this.endDate,
    this.logo,
    this.images,
    this.description,
    this.perpetual,
    this.phoneNumber,
    this.companyShortMobile,
    this.location,
  });

  factory OfferDetailsResponse.fromJson(String str) =>
      OfferDetailsResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OfferDetailsResponse.fromMap(Map<String, dynamic> json) =>
      OfferDetailsResponse(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        barcode: json["barcode"] == null ? null : json["barcode"],
        startDate: json["startDate"],
        endDate: json["endDate"] == null ? null : json["endDate"],
        logo: json["logo"] == null ? null : json["logo"],
        images: json["images"] == null
            ? null
            : List<String>.from(json["images"].map((x) => x)),
        description: json["description"] == null ? null : json["description"],
        perpetual: json["perpetual"] == null ? null : json["perpetual"],
        phoneNumber: json["phone"],
        companyShortMobile: json["companyShortMobile"] == null
            ? null
            : CompanyShortMobile.fromMap(json["companyShortMobile"]),
        location: json["location"] == null
            ? null
            : List<PointShortDto>.from(
                json["location"].map((x) => PointShortDto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "startDate": startDate,
        "endDate": endDate == null ? null : endDate,
        "logo": logo == null ? null : logo,
        "images":
            images == null ? null : List<dynamic>.from(images.map((x) => x)),
        "description": description == null ? null : description,
        "perpetual": perpetual == null ? null : perpetual,
        "phoneNumber": phoneNumber,
        "companyShortMobile":
            companyShortMobile == null ? null : companyShortMobile.toMap(),
        "location": location == null
            ? null
            : List<dynamic>.from(location.map((x) => x.toMap())),
      };
}
