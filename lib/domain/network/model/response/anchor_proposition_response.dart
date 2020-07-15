import 'dart:convert';

import 'package:flutter/material.dart';

class AnchorPropositionResponse {
  AnchorPropositionResponse({
    @required this.id,
    @required this.discount,
    @required this.units,
    @required this.conditionDescription,
  });

  final int id;
  final String discount;
  final String units;
  final String conditionDescription;

  factory AnchorPropositionResponse.fromJson(String str) =>
      AnchorPropositionResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AnchorPropositionResponse.fromMap(Map<String, dynamic> json) =>
      AnchorPropositionResponse(
        id: json["id"] == null ? null : json["id"],
        discount: json["discount"] == null ? null : json["discount"],
        units: json["units"] == null ? null : json["units"],
        conditionDescription: json["conditionDescription"] == null
            ? null
            : json["conditionDescription"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "discount": discount == null ? null : discount,
        "units": units == null ? null : units,
        "conditionDescription":
            conditionDescription == null ? null : conditionDescription,
      };
}
