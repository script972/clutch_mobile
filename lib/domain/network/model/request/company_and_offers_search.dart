import 'dart:convert';

class CompanyAndOffersSearch {
  String title;
  double lat;
  double lng;

  CompanyAndOffersSearch({this.title, this.lat, this.lng});

  factory CompanyAndOffersSearch.fromJson(String str) =>
      CompanyAndOffersSearch.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CompanyAndOffersSearch.fromMap(Map<String, dynamic> json) =>
      CompanyAndOffersSearch(
        title: json["title"],
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "icon": lat,
        "id": lng,
      };
}
