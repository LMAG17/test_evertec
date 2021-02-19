// To parse this JSON data, do
//
//     final payment = paymentFromJson(jsonString);

import 'dart:convert';

import 'package:test_evertec/Models/Basics/amount.dart';
import 'package:test_evertec/Models/Basics/auth.dart';

class SearchRequest {
  SearchRequest({
    this.auth,
    this.reference,
    this.amount,
  });

  Auth auth;
  String reference;
  Amount amount;

  factory SearchRequest.fromRawJson(String str) =>
      SearchRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SearchRequest.fromJson(Map<String, dynamic> json) => SearchRequest(
        auth: json["auth"] == null ? null : Auth.fromJson(json["auth"]),
        reference: json["reference"] == null ? null : json["reference"],
        amount: json["amount"] == null ? null : Amount.fromJson(json["amount"]),
      );

  Map<String, dynamic> toJson() => {
        "auth": auth == null ? null : auth.toJson(),
        "reference": reference == null ? null : reference,
        "amount": amount == null ? null : amount.toJson(),
      };
}
