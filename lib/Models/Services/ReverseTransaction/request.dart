// To parse this JSON data, do
//
//     final payment = paymentFromJson(jsonString);

import 'dart:convert';

import 'package:test_evertec/Models/Basics/auth.dart';

class ReverseTransactionRequest {
  ReverseTransactionRequest({
    this.auth,
    this.internalReference,
    this.authorization,
    this.action,
  });

  Auth auth;
  int internalReference;
  String authorization;
  String action;

  factory ReverseTransactionRequest.fromRawJson(String str) =>
      ReverseTransactionRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReverseTransactionRequest.fromJson(Map<String, dynamic> json) =>
      ReverseTransactionRequest(
        auth: json["auth"] == null ? null : Auth.fromJson(json["auth"]),
        internalReference: json["internalReference"] == null
            ? null
            : json["internalReference"],
        authorization:
            json["authorization"] == null ? null : json["authorization"],
        action: json["action"] == null ? null : json["action"],
      );

  Map<String, dynamic> toJson() => {
        "auth": auth == null ? null : auth.toJson(),
        "internalReference":
            internalReference == null ? null : internalReference,
        "authorization": authorization == null ? null : authorization,
        "action": action == null ? null : action,
      };
}
