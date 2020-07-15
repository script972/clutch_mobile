import 'dart:convert';

import 'package:clutch/domain/network/model/response/anchor_proposition_response.dart';
import 'package:clutch/domain/network/model/response/categories_response.dart';
import 'package:clutch/domain/network/model/response/offers_short_mobile_dto.dart';
import 'package:clutch/domain/network/model/response/point_short_dto.dart';

class CompanyDetailsResponse {
  final int id;
  final String barcode;
  final String logo;
  final String color;
  final bool justOnline;
  final String title;
  final double rang;
  final String description;
  final String site;
  final String phone;
  final List<OffersShortMobileDto> offersShortMobileDtoList;
  final List<PointShortDto> pointShortMobileDtoList;
  final CategoriesResponse categoryDto;
  final AnchorPropositionResponse anchorPropositionResponse;

  CompanyDetailsResponse(
      {this.id,
      this.barcode,
      this.logo,
      this.color,
      this.justOnline,
      this.title,
      this.rang,
      this.description,
      this.site,
      this.phone,
      this.offersShortMobileDtoList,
      this.pointShortMobileDtoList,
      this.categoryDto,
      this.anchorPropositionResponse});

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
        rang: json["rang"],
        description: json["description"],
        site: json["site"],
        phone: json["phone"],
        categoryDto: json["categories"] == null
            ? null
            : CategoriesResponse.fromMap(json["categories"]),
        offersShortMobileDtoList: List<OffersShortMobileDto>.from(
            json["offersShortMobileDtoList"]
                .map((x) => OffersShortMobileDto.fromMap(x))),
        pointShortMobileDtoList: List<PointShortDto>.from(
            json["pointShortMobileDtoList"]
                .map((x) => PointShortDto.fromMap(x))),
        anchorPropositionResponse: json["anchorPropositionResponse"] == null
            ? null
            : AnchorPropositionResponse.fromMap(
                json["anchorPropositionResponse"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "barcode": barcode,
        "logo": logo,
        "color": color,
        "justOnline": justOnline,
        "title": title,
        "rang": rang,
        "description": description,
        "site": site,
        "phone": phone,
        "categories": categoryDto.toMap(),
        "offersShortMobileDtoList":
            List<dynamic>.from(offersShortMobileDtoList.map((x) => x.toMap())),
        "pointShortMobileDtoList":
            List<dynamic>.from(pointShortMobileDtoList.map((x) => x.toMap())),
        "anchorPropositionResponse": anchorPropositionResponse == null
            ? null
            : anchorPropositionResponse.toMap(),
      };
}
