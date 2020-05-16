import 'dart:convert';

class OffersShortMobileDto {
  final int id;
  final String title;
  final String image;
  final int finish;
  final double distance;
  bool big;

  OffersShortMobileDto({
    this.id,
    this.title,
    this.image,
    this.finish,
    this.distance,
    this.big,
  });

  factory OffersShortMobileDto.fromJson(String str) =>
      OffersShortMobileDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OffersShortMobileDto.fromMap(Map<String, dynamic> json) =>
      OffersShortMobileDto(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        finish: json["finish"] == null ? null : json["finish"],
        distance: json["distance"],
        big: json["big"],
      );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "image": image,
    "finish": finish == null ? null : finish,
    "distance": distance,
    "big": big,
  };
}