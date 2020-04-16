
import 'dart:convert';

class OfferResponse {
  final String image;
  final String subtitle;
  final int id;
  final String title;

  OfferResponse({
    this.image,
    this.subtitle,
    this.id,
    this.title,
  });

  factory OfferResponse.fromJson(String str) => OfferResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OfferResponse.fromMap(Map<String, dynamic> json) => OfferResponse(
    image: json["image"],
    subtitle: json["subtitle"],
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toMap() => {
    "image": image,
    "subtitle": subtitle,
    "id": id,
    "title": title,
  };
}