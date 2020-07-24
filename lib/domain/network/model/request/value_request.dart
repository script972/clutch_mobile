import 'dart:convert';

class ValueRequest {
  String value;

  ValueRequest({this.value});

  String toJson() => json.encode(toMap());

  factory ValueRequest.fromMap(Map<String, dynamic> json) => ValueRequest(
        value: json["value"] == null ? null : json["value"],
      );

  Map<String, dynamic> toMap() => {
        "value": value == null ? null : value,
      };
}
