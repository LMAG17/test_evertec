// To parse this JSON data, do
//
//     final payment = paymentFromJson(jsonString);

import 'dart:convert';

import 'package:test_evertec/Models/Basics/instrument.dart';
import 'package:test_evertec/Models/Basics/status.dart';

class TokenizeResponse {
  TokenizeResponse({
    this.status,
    this.provider,
    this.instrument,
  });

  Status status;
  String provider;
  Instrument instrument;

  factory TokenizeResponse.fromRawJson(String str) =>
      TokenizeResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TokenizeResponse.fromJson(Map<String, dynamic> json) =>
      TokenizeResponse(
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        provider: json["provider"] == null ? null : json["provider"],
        instrument: json["instrument"] == null
            ? null
            : Instrument.fromJson(json["instrument"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status.toJson(),
        "provider": provider == null ? null : provider,
        "instrument": instrument == null ? null : instrument.toJson(),
      };
}
