import 'dart:convert';

import 'package:flutter/material.dart';

class PhoneInitRequest {
  final String phone;
  final bool debug;

  PhoneInitRequest({
    @required this.phone,
    @required this.debug,
  });

  factory PhoneInitRequest.fromJson(String str) =>
      PhoneInitRequest.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PhoneInitRequest.fromMap(Map<String, dynamic> json) =>
      PhoneInitRequest(
        phone: json['phone'],
        debug: json['debug'],
      );

  Map<String, dynamic> toMap() => {
        'phone': phone,
        'debug': debug,
      };
}
