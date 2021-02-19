// To parse this JSON data, do
//
//     final payment = paymentFromJson(jsonString);

import 'dart:convert';

import 'package:test_evertec/Models/Basics/credit.dart';
import 'package:test_evertec/Models/Basics/status.dart';

class InformationResponse {
  InformationResponse({
    this.status,
    this.provider,
    this.cardTypes,
    this.displayInterest,
    this.requireOtp,
    this.requireCvv2,
    this.threeDs,
    this.credits,
  });

  Status status;
  String provider;
  List<String> cardTypes;
  bool displayInterest;
  bool requireOtp;
  bool requireCvv2;
  String threeDs;
  List<Credit> credits;

  factory InformationResponse.fromRawJson(String str) =>
      InformationResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory InformationResponse.fromJson(Map<String, dynamic> json) =>
      InformationResponse(
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        provider: json["provider"] == null ? null : json["provider"],
        cardTypes: json["cardTypes"] == null
            ? null
            : List<String>.from(json["cardTypes"].map((x) => x)),
        displayInterest:
            json["displayInterest"] == null ? null : json["displayInterest"],
        requireOtp: json["requireOtp"] == null ? null : json["requireOtp"],
        requireCvv2: json["requireCvv2"] == null ? null : json["requireCvv2"],
        threeDs: json["threeDS"] == null ? null : json["threeDS"],
        credits: json["credits"] == null
            ? null
            : List<Credit>.from(json["credits"].map((x) => Credit.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status.toJson(),
        "provider": provider == null ? null : provider,
        "cardTypes": cardTypes == null
            ? null
            : List<dynamic>.from(cardTypes.map((x) => x)),
        "displayInterest": displayInterest == null ? null : displayInterest,
        "requireOtp": requireOtp == null ? null : requireOtp,
        "requireCvv2": requireCvv2 == null ? null : requireCvv2,
        "threeDS": threeDs == null ? null : threeDs,
        "credits": credits == null
            ? null
            : List<dynamic>.from(credits.map((x) => x.toJson())),
      };
}
