// To parse this JSON data, do
//
//     final Amount = AmountFromJson(jsonString);

import 'dart:convert';

import 'package:test_evertec/Models/Basics/amount_detail.dart';
import 'package:test_evertec/Models/Basics/tax_detail.dart';

class Amount {
  Amount({
    this.currency,
    this.taxes,
    this.details,
    this.total,
  });

  String currency;
  List<TaxDetail> taxes;
  List<AmountDetail> details;
  double total;

  factory Amount.fromRawJson(String str) => Amount.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Amount.fromJson(Map<String, dynamic> json) => Amount(
        currency: json["currency"] == null ? null : json["currency"],
        taxes: json["taxes"] == null
            ? null
            : List<TaxDetail>.from(
                json["taxes"].map((x) => TaxDetail.fromJson(x))),
        details: json["details"] == null
            ? null
            : List<AmountDetail>.from(
                json["details"].map((x) => AmountDetail.fromJson(x))),
        total: json["total"] == null ? null : json["total"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency == null ? null : currency,
        "taxes": taxes == null
            ? null
            : List<dynamic>.from(taxes.map((x) => x.toJson())),
        "details": details == null
            ? null
            : List<dynamic>.from(details.map((x) => x.toJson())),
        "total": total == null ? null : total,
      };
}
