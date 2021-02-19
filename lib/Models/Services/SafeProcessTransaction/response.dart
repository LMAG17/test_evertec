// To parse this JSON data, do
//
//     final payment = paymentFromJson(jsonString);

import 'dart:convert';

import 'package:test_evertec/Models/Basics/amount.dart';
import 'package:test_evertec/Models/Basics/amount_conversion.dart';
import 'package:test_evertec/Models/Basics/status.dart';
import 'package:test_evertec/Models/Services/ProcessTransaction/response.dart';

class SafeProcessTransactionResponse {
  SafeProcessTransactionResponse({
    this.status,
    this.internalReference,
    this.reference,
    this.paymentMethod,
    this.franchise,
    this.franchiseName,
    this.issuerName,
    this.amount,
    this.conversion,
    this.authorization,
    this.receipt,
    this.type,
    this.refunded,
    this.lastDigits,
    this.provider,
    this.discount,
    this.processorFields,
    this.additional,
  });

  Status status;
  int internalReference;
  String reference;
  String paymentMethod;
  String franchise;
  String franchiseName;
  String issuerName;
  Amount amount;
  AmountConversion conversion;
  String authorization;
  int receipt;
  String type;
  bool refunded;
  String lastDigits;
  String provider;
  dynamic discount;
  List<dynamic> processorFields;
  Additional additional;

  factory SafeProcessTransactionResponse.fromRawJson(String str) =>
      SafeProcessTransactionResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SafeProcessTransactionResponse.fromJson(Map<String, dynamic> json) =>
      SafeProcessTransactionResponse(
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        internalReference: json["internalReference"] == null
            ? null
            : json["internalReference"],
        reference: json["reference"] == null ? null : json["reference"],
        paymentMethod:
            json["paymentMethod"] == null ? null : json["paymentMethod"],
        franchise: json["franchise"] == null ? null : json["franchise"],
        franchiseName:
            json["franchiseName"] == null ? null : json["franchiseName"],
        issuerName: json["issuerName"] == null ? null : json["issuerName"],
        amount: json["amount"] == null ? null : Amount.fromJson(json["amount"]),
        conversion: json["conversion"] == null
            ? null
            : AmountConversion.fromJson(json["conversion"]),
        authorization:
            json["authorization"] == null ? null : json["authorization"],
        receipt: json["receipt"] == null ? null : json["receipt"],
        type: json["type"] == null ? null : json["type"],
        refunded: json["refunded"] == null ? null : json["refunded"],
        lastDigits: json["lastDigits"] == null ? null : json["lastDigits"],
        provider: json["provider"] == null ? null : json["provider"],
        discount: json["discount"],
        processorFields: json["processorFields"] == null
            ? null
            : List<dynamic>.from(json["processorFields"].map((x) => x)),
        additional: json["additional"] == null
            ? null
            : Additional.fromJson(json["additional"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status.toJson(),
        "internalReference":
            internalReference == null ? null : internalReference,
        "reference": reference == null ? null : reference,
        "paymentMethod": paymentMethod == null ? null : paymentMethod,
        "franchise": franchise == null ? null : franchise,
        "franchiseName": franchiseName == null ? null : franchiseName,
        "issuerName": issuerName == null ? null : issuerName,
        "amount": amount == null ? null : amount.toJson(),
        "conversion": conversion == null ? null : conversion.toJson(),
        "authorization": authorization == null ? null : authorization,
        "receipt": receipt == null ? null : receipt,
        "type": type == null ? null : type,
        "refunded": refunded == null ? null : refunded,
        "lastDigits": lastDigits == null ? null : lastDigits,
        "provider": provider == null ? null : provider,
        "discount": discount,
        "processorFields": processorFields == null
            ? null
            : List<dynamic>.from(processorFields.map((x) => x)),
        "additional": additional == null ? null : additional.toJson(),
      };
}
