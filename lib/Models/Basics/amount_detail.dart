// To parse this JSON data, do
//
//     final AmountDetail = AmountDetailFromJson(jsonString);

import 'dart:convert';

class AmountDetail {
  AmountDetail({
    this.kind,
    this.amount,
  });

  String kind;
  double amount;

  factory AmountDetail.fromRawJson(String str) =>
      AmountDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AmountDetail.fromJson(Map<String, dynamic> json) => AmountDetail(
        kind: json["kind"] == null ? null : json["kind"],
        amount: json["amount"] == null ? null : json["amount"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind == null ? null : kind,
        "amount": amount == null ? null : amount,
      };
}
