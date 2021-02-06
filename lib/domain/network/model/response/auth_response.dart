import 'dart:convert';

import 'package:flutter/material.dart';

class AuthResponse {
  AuthResponse({
    @required this.accessToken,
    @required this.expiresIn,
    @required this.authorityList,
  });

  final String accessToken;
  final int expiresIn;
  final List<AuthorityList> authorityList;

  factory AuthResponse.fromJson(String str) =>
      AuthResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthResponse.fromMap(Map<String, dynamic> json) => AuthResponse(
        accessToken: json['accessToken'],
        expiresIn: json['expiresIn'],
        authorityList: json['authorityList'] == null
            ? null
            : List<AuthorityList>.from(
                json['authorityList'].map((x) => AuthorityList.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        'accessToken': accessToken,
        'expiresIn': expiresIn,
        'authorityList': authorityList == null
            ? null
            : List<dynamic>.from(authorityList.map((x) => x.toMap())),
      };
}

class AuthorityList {
  AuthorityList({
    @required this.id,
    @required this.authority,
  });

  final int id;
  final String authority;

  factory AuthorityList.fromJson(String str) =>
      AuthorityList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthorityList.fromMap(Map<String, dynamic> json) => AuthorityList(
        id: json['id'],
        authority: json['authority'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'authority': authority,
      };
}
