// To parse this JSON data, do
//
//     final AmountConversion = AmountConversionFromJson(jsonString);

import 'dart:convert';

class AmountBase {
  AmountBase({
    this.currency,
    this.total,
  });

  String currency;
  double total;

  factory AmountBase.fromRawJson(String str) =>
      AmountBase.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AmountBase.fromJson(Map<String, dynamic> json) => AmountBase(
        currency: json["currency"] == null ? null : json["currency"],
        total: json["total"] == null ? null : json["total"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency == null ? null : currency,
        "total": total == null ? null : total,
      };
}
