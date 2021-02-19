// To parse this JSON data, do
//
//     final payment = paymentFromJson(jsonString);

import 'dart:convert';

import 'package:test_evertec/Models/Basics/auth.dart';

class QueryTransactionRequest {
  QueryTransactionRequest({
    this.auth,
    this.internalReference,
  });

  Auth auth;
  int internalReference;

  factory QueryTransactionRequest.fromRawJson(String str) =>
      QueryTransactionRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory QueryTransactionRequest.fromJson(Map<String, dynamic> json) =>
      QueryTransactionRequest(
        auth: json["auth"] == null ? null : Auth.fromJson(json["auth"]),
        internalReference: json["internalReference"] == null
            ? null
            : json["internalReference"],
      );

  Map<String, dynamic> toJson() => {
        "auth": auth == null ? null : auth.toJson(),
        "internalReference":
            internalReference == null ? null : internalReference,
      };
}
