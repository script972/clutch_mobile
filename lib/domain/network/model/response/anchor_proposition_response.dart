import 'dart:convert';

import 'package:flutter/material.dart';

class AnchorPropositionResponse {
  final int id;
  final String discount;
  final String units;
  final String conditionDescription;

  AnchorPropositionResponse({
    @required this.id,
    @required this.discount,
    @required this.units,
    @required this.conditionDescription,
  });

  factory AnchorPropositionResponse.fromJson(String str) =>
      AnchorPropositionResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AnchorPropositionResponse.fromMap(Map<String, dynamic> json) =>
      AnchorPropositionResponse(
        id: json['id'],
        discount: json['discount'],
        units: json['units'],
        conditionDescription: json['conditionDescription'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'discount': discount,
        'units': units,
        'conditionDescription': conditionDescription,
      };
}
