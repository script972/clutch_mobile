import 'dart:convert';

import 'package:clutch/domain/network/model/response/verified_type.dart';
import 'package:clutch/helpers/date_formatting_helper.dart';
import 'package:meta/meta.dart';

class CompanyWithPaidAccess {
  final int id;
  final String title;
  final String categories;
  final String color;
  final String description;
  final String phone;
  final VerifiedType verifiedType;
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

  factory CompanyWithPaidAccess.fromJson(String str) =>
      CompanyWithPaidAccess.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CompanyWithPaidAccess.fromMap(Map<String, dynamic> json) =>
      CompanyWithPaidAccess(
        id: json['id'],
        title: json['title'],
        categories: json['categories'],
        color: json['color'],
        description: json['description'],
        phone: json['phone'],
        verifiedType: json['verifiedType'] == null
            ? null
            : DateFormattingHelper.enumFromString<VerifiedType>(
                json['verifiedType'], VerifiedType.values),
        verifyViaEmailOrAdmin: json['verifyViaEmailOrAdmin'],
        logoUrl: json['logo_url'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'categories': categories,
        'color': color,
        'description': description,
        'phone': phone,
        'verifiedType': verifiedType,
        'verifyViaEmailOrAdmin': verifyViaEmailOrAdmin,
        'logo_url': logoUrl,
      };
}
