import 'dart:convert';

import 'package:flutter/cupertino.dart';

class CompanyShortMobile {
  final int id;
  final String title;
  final String logo;
  final Color color;
  final double distance;

  CompanyShortMobile({
    this.id,
    this.title,
    this.logo,
    this.color,
    this.distance,
  });

  factory CompanyShortMobile.fromJson(String str) =>
      CompanyShortMobile.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CompanyShortMobile.fromMap(Map<String, dynamic> json) =>
      CompanyShortMobile(
        id: json["id"],
        title: json["title"],
        logo: json["logo"],
        color: json["color"],
        distance: json["distance"],
      );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "logo": logo,
    "color": color,
    "distance": distance,
  };
}