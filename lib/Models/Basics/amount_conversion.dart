// To parse this JSON data, do
//
//     final AmountConversion = AmountConversionFromJson(jsonString);

import 'dart:convert';

import 'package:test_evertec/Models/Basics/amount_base.dart';

class AmountConversion {
  AmountConversion({
    this.from,
    this.to,
    this.factor,
  });

  AmountBase from;
  AmountBase to;
  double factor;

  factory AmountConversion.fromRawJson(String str) =>
      AmountConversion.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AmountConversion.fromJson(Map<String, dynamic> json) =>
      AmountConversion(
        from: json["from"] == null ? null : AmountBase.fromJson(json["from"]),
        to: json["to"] == null ? null : AmountBase.fromJson(json["to"]),
        factor: json["factor"] == null ? null : json["factor"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "from": from == null ? null : from.toJson(),
        "to": to == null ? null : to.toJson(),
        "factor": factor == null ? null : factor,
      };
}
