import 'dart:convert';

import 'package:clutch/domain/network/model/response/categories_response.dart';
import 'package:clutch/domain/network/model/response/company_short_mobile.dart';
import 'package:clutch/domain/network/model/response/main_point_short_mobile_response.dart';
import 'package:clutch/domain/network/model/response/offers_short_mobile_dto.dart';

class MainInfo {
  final List<OffersShortMobileDto> offersShortMobileDtoList;
  final List<CompanyShortMobile> companyShortMobileDtoList;
  final List<CategoriesResponse> categoriesDtoList;
  final List<MainPointShortMobileResponse> pointShortMobileDtoList;

  MainInfo(
      {this.offersShortMobileDtoList,
      this.companyShortMobileDtoList,
      this.categoriesDtoList,
      this.pointShortMobileDtoList});

  factory MainInfo.fromJson(String str) => MainInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MainInfo.fromMap(Map<String, dynamic> json) => MainInfo(
        offersShortMobileDtoList: List<OffersShortMobileDto>.from(
            json['offersShortMobileDtoList']
                .map((x) => OffersShortMobileDto.fromMap(x))),
        companyShortMobileDtoList: List<CompanyShortMobile>.from(
            json['companyShortMobileDtoList']
                .map((x) => CompanyShortMobile.fromMap(x))),
        categoriesDtoList: List<CategoriesResponse>.from(
            json['categoriesDtoList']
                .map((x) => CategoriesResponse.fromMap(x))),
        pointShortMobileDtoList: List<MainPointShortMobileResponse>.from(
            json['pointShortMobileDtoList']
                .map((x) => MainPointShortMobileResponse.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        'offersShortMobileDtoList':
            List<dynamic>.from(offersShortMobileDtoList.map((x) => x.toMap())),
        'companyShortMobileDtoList':
            List<dynamic>.from(companyShortMobileDtoList.map((x) => x.toMap())),
        'categoriesDtoList':
            List<dynamic>.from(categoriesDtoList.map((x) => x.toMap())),
        'pointShortMobileDtoList':
            List<dynamic>.from(pointShortMobileDtoList.map((x) => x.toMap())),
      };
}
