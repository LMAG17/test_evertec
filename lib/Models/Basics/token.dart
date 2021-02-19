// To parse this JSON data, do
//
//     final Instrument = InstrumentFromJson(jsonString);

import 'dart:convert';

class Token {
  Token({
    this.token,
    this.subtoken,
    this.franchise,
    this.franchiseName,
    this.issuerName,
    this.lastDigits,
    this.validUntil,
  });

  String token;
  String subtoken;
  String franchise;
  String franchiseName;
  String issuerName;
  String lastDigits;
  String validUntil;

  factory Token.fromRawJson(String str) => Token.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        token: json["token"] == null ? null : json["token"],
        subtoken: json["subtoken"] == null ? null : json["subtoken"],
        franchise: json["franchise"] == null ? null : json["franchise"],
        franchiseName:
            json["franchiseName"] == null ? null : json["franchiseName"],
        issuerName: json["issuerName"] == null ? null : json["issuerName"],
        lastDigits: json["lastDigits"] == null ? null : json["lastDigits"],
        validUntil: json["validUntil"] == null ? null : json["validUntil"],
      );

  Map<String, dynamic> toJson() => {
        "token": token == null ? null : token,
        "subtoken": subtoken == null ? null : subtoken,
        "franchise": franchise == null ? null : franchise,
        "franchiseName": franchiseName == null ? null : franchiseName,
        "issuerName": issuerName == null ? null : issuerName,
        "lastDigits": lastDigits == null ? null : lastDigits,
        "validUntil": validUntil == null ? null : validUntil,
      };
}
