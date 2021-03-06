import 'dart:convert';

import 'package:clutch/domain/network/model/response/categories_response.dart';
import 'package:clutch/domain/network/model/response/company_short_mobile.dart';
import 'package:clutch/domain/network/model/response/point_short_dto.dart';

class OfferDetailsResponse {
  int id;
  String title;
  String barcode;
  int startDate;
  int endDate;
  String logo;
  List<String> images;
  String description;
  bool perpetual;
  String phoneNumber;
  CompanyShortMobile companyShortMobile;
  CategoriesResponse categoryDto;
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
    this.categoryDto,
    this.location,
  });

  factory OfferDetailsResponse.fromJson(String str) =>
      OfferDetailsResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OfferDetailsResponse.fromMap(Map<String, dynamic> json) =>
      OfferDetailsResponse(
        id: json['id'],
        title: json['title'],
        barcode: json['barcode'],
        startDate: json['startDate'],
        endDate: json['endDate'],
        logo: json['logo'],
        images: json['images'] == null
            ? null
            : List<String>.from(json['images'].map((x) => x)),
        description: json['description'],
        perpetual: json['perpetual'],
        phoneNumber: json['phoneNumber'],
        companyShortMobile: json['companyShortMobile'] == null
            ? null
            : CompanyShortMobile.fromMap(json['companyShortMobile']),
        categoryDto: json['categoryDto'] == null
            ? null
            : CategoriesResponse.fromMap(json['categoryDto']),
        location: json['location'] == null
            ? null
            : List<PointShortDto>.from(
                json['location'].map((x) => PointShortDto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'startDate': startDate,
        'endDate': endDate,
        'logo': logo,
        'images':
            images == null ? null : List<dynamic>.from(images.map((x) => x)),
        'description': description,
        'perpetual': perpetual,
        'phoneNumber': phoneNumber,
        'companyShortMobile':
            companyShortMobile == null ? null : companyShortMobile.toMap(),
        'categoryDto': categoryDto == null ? null : categoryDto.toMap(),
        'location': location == null
            ? null
            : List<dynamic>.from(location.map((x) => x.toMap())),
      };
}
