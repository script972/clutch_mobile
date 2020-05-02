import 'dart:convert';

import 'package:clutch/domain/network/model/response/company_short_mobile.dart';
import 'package:clutch/domain/network/model/response/offers_short_mobile_dto.dart';

class MainInfo {
  final List<OffersShortMobileDto> offersShortMobileDtoList;
  final List<CompanyShortMobile> companyShortMobileList;

  MainInfo({
    this.offersShortMobileDtoList,
    this.companyShortMobileList,
  });

  factory MainInfo.fromJson(String str) => MainInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MainInfo.fromMap(Map<String, dynamic> json) => MainInfo(
        offersShortMobileDtoList: List<OffersShortMobileDto>.from(
            json["offersShortMobileDtoList"]
                .map((x) => OffersShortMobileDto.fromMap(x))),
        companyShortMobileList: List<CompanyShortMobile>.from(
            json["companyShortMobileList"]
                .map((x) => CompanyShortMobile.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "offersShortMobileDtoList":
            List<dynamic>.from(offersShortMobileDtoList.map((x) => x.toMap())),
        "companyShortMobileList":
            List<dynamic>.from(companyShortMobileList.map((x) => x.toMap())),
      };
}




