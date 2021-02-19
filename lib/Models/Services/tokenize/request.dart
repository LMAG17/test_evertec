// To parse this JSON data, do
//
//     final payment = paymentFromJson(jsonString);

import 'dart:convert';

import 'package:test_evertec/Models/Basics/auth.dart';
import 'package:test_evertec/Models/Basics/instrument.dart';
import 'package:test_evertec/Models/Basics/person.dart';

class TokenizeRequest {
  TokenizeRequest({
    this.auth,
    this.payer,
    this.instrument,
    this.ipAddress,
    this.userAgent,
  });

  Auth auth;
  Person payer;
  Instrument instrument;
  String ipAddress;
  String userAgent;

  factory TokenizeRequest.fromRawJson(String str) =>
      TokenizeRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TokenizeRequest.fromJson(Map<String, dynamic> json) =>
      TokenizeRequest(
        auth: json["auth"] == null ? null : Auth.fromJson(json["auth"]),
        payer: json["payer"] == null ? null : Person.fromJson(json["payer"]),
        instrument: json["instrument"] == null
            ? null
            : Instrument.fromJson(json["instrument"]),
        ipAddress: json["ipAddress"] == null ? null : json["ipAddress"],
        userAgent: json["userAgent"] == null ? null : json["userAgent"],
      );

  Map<String, dynamic> toJson() => {
        "auth": auth == null ? null : auth.toJson(),
        "payer": payer == null ? null : payer.toJson(),
        "instrument": instrument == null ? null : instrument.toJson(),
        "ipAddress": ipAddress == null ? null : ipAddress,
        "userAgent": userAgent == null ? null : userAgent,
      };
}
