// To parse this JSON data, do
//
//     final TaxDetail = TaxDetailFromJson(jsonString);

import 'dart:convert';

class TaxDetail {
  TaxDetail({
    this.kind,
    this.amount,
    this.base,
  });

  String kind;
  double amount;
  double base;

  factory TaxDetail.fromRawJson(String str) =>
      TaxDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TaxDetail.fromJson(Map<String, dynamic> json) => TaxDetail(
        kind: json["kind"] == null ? null : json["kind"],
        amount: json["amount"] == null ? null : json["amount"].toDouble(),
        base: json["base"] == null ? null : json["base"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind == null ? null : kind,
        "amount": amount == null ? null : amount,
        "base": base == null ? null : base,
      };
}
