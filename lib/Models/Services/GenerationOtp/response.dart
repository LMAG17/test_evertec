// To parse this JSON data, do
//
//     final payment = paymentFromJson(jsonString);

import 'dart:convert';

import 'package:test_evertec/Models/Basics/status.dart';

class GenerationOtpResponse {
  GenerationOtpResponse({
    this.status,
    this.provider,
  });

  Status status;
  String provider;

  factory GenerationOtpResponse.fromRawJson(String str) =>
      GenerationOtpResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GenerationOtpResponse.fromJson(Map<String, dynamic> json) =>
      GenerationOtpResponse(
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        provider: json["provider"] == null ? null : json["provider"],
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status.toJson(),
        "provider": provider == null ? null : provider,
      };
}
