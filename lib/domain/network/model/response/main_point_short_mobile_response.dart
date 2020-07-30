import 'dart:convert';

import 'package:meta/meta.dart';

import 'anchor_proposition_response.dart';

class MainPointShortMobileResponse {
  final int companyId;
  final int pointId;
  final String address;
  final String companyTitle;
  final String pointTitle;
  final dynamic companyLogo;
  final AnchorPropositionResponse anchorDiscount;
  final String pointImage;
  final double lat;
  final double lng;

  MainPointShortMobileResponse({
    @required this.companyId,
    @required this.pointId,
    @required this.address,
    @required this.companyTitle,
    @required this.pointTitle,
    @required this.companyLogo,
    @required this.anchorDiscount,
    @required this.pointImage,
    @required this.lat,
    @required this.lng,
  });

  factory MainPointShortMobileResponse.fromJson(String str) =>
      MainPointShortMobileResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MainPointShortMobileResponse.fromMap(Map<String, dynamic> json) =>
      MainPointShortMobileResponse(
        companyId: json["companyId"] == null ? null : json["companyId"],
        pointId: json["pointId"] == null ? null : json["pointId"],
        address: json["address"] == null ? null : json["address"],
        companyTitle:
            json["companyTitle"] == null ? null : json["companyTitle"],
        pointTitle: json["pointTitle"] == null ? null : json["pointTitle"],
        companyLogo: json["companyLogo"],
        anchorDiscount: json["anchorDiscount"] == null
            ? null
            : AnchorPropositionResponse.fromMap(json["anchorDiscount"]),
        pointImage: json["pointImage"] == null ? null : json["pointImage"],
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
        lng: json["lng"] == null ? null : json["lng"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "companyId": companyId == null ? null : companyId,
        "pointId": pointId == null ? null : pointId,
        "address": address == null ? null : address,
        "companyTitle": companyTitle == null ? null : companyTitle,
        "pointTitle": pointTitle == null ? null : pointTitle,
        "companyLogo": companyLogo,
        "anchorDiscount":
            anchorDiscount == null ? null : anchorDiscount.toMap(),
        "pointImage": pointImage == null ? null : pointImage,
        "lat": lat == null ? null : lat,
        "lng": lng == null ? null : lng,
      };
}
