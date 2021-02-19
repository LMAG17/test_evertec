// To parse this JSON data, do
//
//     final payment = paymentFromJson(jsonString);

import 'dart:convert';

import 'package:test_evertec/Models/Basics/status.dart';

class ValidationOtpResponse {
  ValidationOtpResponse({
    this.status,
    this.provider,
    this.signature,
    this.validated,
  });

  Status status;
  String provider;
  String signature;
  bool validated;

  factory ValidationOtpResponse.fromRawJson(String str) =>
      ValidationOtpResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ValidationOtpResponse.fromJson(Map<String, dynamic> json) =>
      ValidationOtpResponse(
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        provider: json["provider"] == null ? null : json["provider"],
        signature: json["signature"] == null ? null : json["signature"],
        validated: json["validated"] == null ? null : json["validated"],
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status.toJson(),
        "provider": provider == null ? null : provider,
        "signature": signature == null ? null : signature,
        "validated": validated == null ? null : validated,
      };
}
