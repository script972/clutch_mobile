import 'dart:convert';

import 'package:clutch/domain/network/model/response/anchor_proposition_response.dart';
import 'package:clutch/helpers/color_helper.dart';
import 'package:flutter/material.dart';

class CompanyShortMobile {
  final int id;
  final String title;
  final String logo;
  final Color color;
  final double distance;
  final AnchorPropositionResponse anchorPropositionResponse;

  CompanyShortMobile(
      {this.id,
      this.title,
      this.logo,
      this.color,
      this.distance,
      this.anchorPropositionResponse});

  factory CompanyShortMobile.fromJson(String str) =>
      CompanyShortMobile.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CompanyShortMobile.fromMap(Map<String, dynamic> json) =>
      CompanyShortMobile(
        id: json["id"],
        title: json["title"],
        logo: json["logo"] == null ? "" : json["logo"],
        color: ColorHelper.colorFromHex(json["color"]),
        distance: json["distance"],
        anchorPropositionResponse: json["anchorPropositionResponse"] == null
            ? null
            : AnchorPropositionResponse.fromMap(
                json["anchorPropositionResponse"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "logo": logo,
        "color": color,
        "distance": distance,
        "anchorPropositionResponse": anchorPropositionResponse == null
            ? null
            : anchorPropositionResponse.toMap(),
      };
}
