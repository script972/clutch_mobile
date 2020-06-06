import 'dart:convert';

class PhoneSmsConfirmRequest {
  final String phone;
  final String smscode;

  PhoneSmsConfirmRequest({
    this.phone,
    this.smscode,
  });

  factory PhoneSmsConfirmRequest.fromJson(String str) =>
      PhoneSmsConfirmRequest.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PhoneSmsConfirmRequest.fromMap(Map<String, dynamic> json) =>
      PhoneSmsConfirmRequest(phone: json["phone"], smscode: json["smscode"]);

  Map<String, dynamic> toMap() => {"phone": phone, "smscode": smscode};
}
