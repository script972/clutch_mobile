import 'dart:convert';

class PhoneSmsConfirmRequest {
  PhoneSmsConfirmRequest({
    this.phone,
    this.smscode,
    this.debug,
  });

  final String phone;
  final String smscode;
  final bool debug;

  factory PhoneSmsConfirmRequest.fromJson(String str) => PhoneSmsConfirmRequest.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PhoneSmsConfirmRequest.fromMap(Map<String, dynamic> json) => PhoneSmsConfirmRequest(
    phone: json["phone"],
    smscode: json["smscode"],
    debug: json["debug"],
  );

  Map<String, dynamic> toMap() => {
    "phone": phone,
    "smscode": smscode,
    "debug": debug,
  };
}