// To parse this JSON data, do
//
//     final payment = paymentFromJson(jsonString);

import 'dart:convert';

import 'amount.dart';

class Payment {
  Payment({
    this.reference,
    this.amount,
  });

  String reference;
  Amount amount;

  factory Payment.fromRawJson(String str) => Payment.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        reference: json["reference"] == null ? null : json["reference"],
        amount: json["amount"] == null ? null : Amount.fromJson(json["amount"]),
      );

  Map<String, dynamic> toJson() => {
        "reference": reference == null ? null : reference,
        "amount": amount == null ? null : amount.toJson(),
      };
}
