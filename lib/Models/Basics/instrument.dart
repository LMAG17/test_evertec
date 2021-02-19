// To parse this JSON data, do
//
//     final Instrument = InstrumentFromJson(jsonString);

import 'dart:convert';

import 'package:test_evertec/Models/Basics/card.dart';
import 'package:test_evertec/Models/Basics/credit.dart';
import 'package:test_evertec/Models/Basics/token.dart';

class Instrument {
  Instrument({
    this.card,
    this.token,
    this.credit,
    this.otp,
  });

  Card card;
  Token token;
  Credit credit;
  String otp;

  factory Instrument.fromRawJson(String str) =>
      Instrument.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Instrument.fromJson(Map<String, dynamic> json) => Instrument(
        card: json["card"] == null ? null : Card.fromJson(json["card"]),
        token: json["token"] == null ? null : Token.fromJson(json["token"]),
        credit: json["credit"] == null ? null : Credit.fromJson(json["credit"]),
        otp: json["otp"] == null ? null : json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "card": card == null ? null : card.toJson(),
        "token": token == null ? null : token.toJson(),
        "credit": credit == null ? null : credit.toJson(),
        "otp": otp == null ? null : otp,
      };
}
