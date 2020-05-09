import 'dart:convert';

class CategoriesDtoList {
  final String title;
  final String icon;
  final int id;

  CategoriesDtoList({
    this.title,
    this.icon,
    this.id,
  });

  factory CategoriesDtoList.fromJson(String str) => CategoriesDtoList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoriesDtoList.fromMap(Map<String, dynamic> json) => CategoriesDtoList(
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