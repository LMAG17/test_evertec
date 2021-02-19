// To parse this JSON data, do
//
//     final payment = paymentFromJson(jsonString);

import 'dart:convert';

import 'package:test_evertec/Models/Basics/status.dart';
import 'package:test_evertec/Models/Basics/transaction.dart';

class SearchResponse {
  SearchResponse({
    this.status,
    this.transactions,
  });

  Status status;
  List<Transaction> transactions;

  factory SearchResponse.fromRawJson(String str) =>
      SearchResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        transactions: json["transactions"] == null
            ? null
            : List<Transaction>.from(
                json["transactions"].map((x) => Transaction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status.toJson(),
        "transactions": transactions == null
            ? null
            : List<dynamic>.from(transactions.map((x) => x.toJson())),
      };
}
