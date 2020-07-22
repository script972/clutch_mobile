import 'package:meta/meta.dart';
import 'dart:convert';

class CompanyWithPaidAccess {

  final int id;
  final String title;
  final String categories;
  final String color;
  final String description;
  final String phone;
  final String verifiedType;
  final bool verifyViaEmailOrAdmin;
  final String logoUrl;

  CompanyWithPaidAccess({
    @required this.id,
    @required this.title,
    @required this.categories,
    @required this.color,
    @required this.description,
    @required this.phone,
    @required this.verifiedType,
    @required this.verifyViaEmailOrAdmin,
    @required this.logoUrl,
  });


  factory CompanyWithPaidAccess.fromJson(String str) => CompanyWithPaidAccess.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CompanyWithPaidAccess.fromMap(Map<String, dynamic> json) => CompanyWithPaidAccess(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    categories: json["categories"] == null ? null : json["categories"],
    color: json["color"] == null ? null : json["color"],
    description: json["description"] == null ? null : json["description"],
    phone: json["phone"],
    verifiedType: json["verifiedType"] == null ? null : json["verifiedType"],
    verifyViaEmailOrAdmin: json["verifyViaEmailOrAdmin"],
    logoUrl: json["logo_url"] == null ? null : json["logo_url"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "categories": categories == null ? null : categories,
    "color": color == null ? null : color,
    "description": description == null ? null : description,
    "phone": phone,
    "verifiedType": verifiedType == null ? null : verifiedType,
    "verifyViaEmailOrAdmin": verifyViaEmailOrAdmin,
    "logo_url": logoUrl == null ? null : logoUrl,
  };
}
