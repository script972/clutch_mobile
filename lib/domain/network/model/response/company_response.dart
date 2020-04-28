import 'dart:ui';

import 'dart:convert';

import 'package:clutch/domain/network/model/response/offer_response.dart';
import 'package:clutch/helpers/color_helper.dart';

class CompanyResponse {
  OfferResponse offers;
  final String image;
  final Color color;
  final int id;
  final String title;

  CompanyResponse(this.id, this.title, this.image, this.color);

  factory CompanyResponse.fromJson(String str) =>
      CompanyResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CompanyResponse.fromMap(Map<String, dynamic> json) => CompanyResponse(
        //offers: OfferResponse.fromMap(json["offers"]),
        json["id"],
        json["title"],
        json["image"],
        ColorHelper.stringToColor(json["color"]),
      );

  Map<String, dynamic> toMap() => {
        "offers": offers.toMap(),
        "image": image,
        "color": color,
        "id": id,
        "title": title,
      };
}
