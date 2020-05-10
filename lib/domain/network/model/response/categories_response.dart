import 'dart:convert';

class CategoriesResponse {
  final String title;
  final String icon;
  final int id;

  CategoriesResponse({
    this.title,
    this.icon,
    this.id,
  });

  factory CategoriesResponse.fromJson(String str) => CategoriesResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoriesResponse.fromMap(Map<String, dynamic> json) => CategoriesResponse(
    title: json["title"],
    icon: json["icon"],
    id: json["id"],
  );

  Map<String, dynamic> toMap() => {
    "title": title,
    "icon": icon,
    "id": id,
  };
}