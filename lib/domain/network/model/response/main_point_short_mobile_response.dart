import 'dart:convert';

import 'package:meta/meta.dart';

import 'anchor_proposition_response.dart';

class MainPointShortMobileResponse {
  final int companyId;
  final int pointId;
  final String address;
  final String companyTitle;
  final String pointTitle;
  final String companyLogo;
  final AnchorPropositionResponse anchorDiscount;
  final String pointImage;
  final double lat;
  final double lng;
  final double distance;

  MainPointShortMobileResponse({
    @required this.companyId,
    @required this.pointId,
    @required this.address,
    @required this.companyTitle,
    @required this.pointTitle,
    @required this.companyLogo,
    @required this.anchorDiscount,
    @required this.pointImage,
    @required this.lat,
    @required this.lng,
    @required this.distance,
  });

  factory MainPointShortMobileResponse.fromJson(String str) =>
      MainPointShortMobileResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MainPointShortMobileResponse.fromMap(Map<String, dynamic> json) =>
      MainPointShortMobileResponse(
        companyId: json['companyId'],
        pointId: json['pointId'],
        address: json['address'],
        companyTitle: json['companyTitle'],
        pointTitle: json['pointTitle'],
        companyLogo: json['companyLogo'],
        anchorDiscount: json['anchorDiscount'] == null
            ? null
            : AnchorPropositionResponse.fromMap(json['anchorDiscount']),
        pointImage: json['pointImage'],
        lat: json['lat'] == null ? null : json['lat'].toDouble(),
        lng: json['lng'] == null ? null : json['lng'].toDouble(),
        distance: json['distanceToUser'] == null
            ? null
            : json['distanceToUser'].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        'companyId': companyId,
        'pointId': pointId,
        'address': address,
        'companyTitle': companyTitle,
        'pointTitle': pointTitle,
        'companyLogo': companyLogo,
        'anchorDiscount':
            anchorDiscount == null ? null : anchorDiscount.toMap(),
        'pointImage': pointImage,
        'lat': lat,
        'lng': lng,
        'distanceToUser': distance,
      };
}
