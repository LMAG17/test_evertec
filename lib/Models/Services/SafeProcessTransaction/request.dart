// To parse this JSON data, do
//
//     final payment = paymentFromJson(jsonString);

import 'dart:convert';

import 'package:test_evertec/Models/Basics/auth.dart';
import 'package:test_evertec/Models/Basics/instrument.dart';
import 'package:test_evertec/Models/Basics/payment.dart';
import 'package:test_evertec/Models/Basics/person.dart';

class SafeProcessTransactionRequest {
  SafeProcessTransactionRequest({
    this.auth,
    this.locale,
    this.payment,
    this.ipAddress,
    this.userAgent,
    this.additional,
    this.instrument,
    this.payer,
    this.buyer,
  });

  Auth auth;
  String locale;
  Payment payment;
  String ipAddress;
  String userAgent;
  List<String> additional;
  Instrument instrument;
  Person payer;
  Person buyer;

  factory SafeProcessTransactionRequest.fromRawJson(String str) =>
      SafeProcessTransactionRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SafeProcessTransactionRequest.fromJson(Map<String, dynamic> json) =>
      SafeProcessTransactionRequest(
        auth: json["auth"] == null ? null : Auth.fromJson(json["auth"]),
        locale: json["locale"] == null ? null : json["locale"],
        payment:
            json["payment"] == null ? null : Payment.fromJson(json["payment"]),
        ipAddress: json["ipAddress"] == null ? null : json["ipAddress"],
        userAgent: json["userAgent"] == null ? null : json["userAgent"],
        additional: json["additional"] == null
            ? null
            : List<String>.from(json["additional"].map((x) => x)),
        instrument: json["instrument"] == null
            ? null
            : Instrument.fromJson(json["instrument"]),
        payer: json["payer"] == null ? null : Person.fromJson(json["payer"]),
        buyer: json["buyer"] == null ? null : Person.fromJson(json["buyer"]),
      );

  Map<String, dynamic> toJson() => {
        "auth": auth == null ? null : auth.toJson(),
        "locale": locale == null ? null : locale,
        "payment": payment == null ? null : payment.toJson(),
        "ipAddress": ipAddress == null ? null : ipAddress,
        "userAgent": userAgent == null ? null : userAgent,
        "additional": additional == null
            ? null
            : List<dynamic>.from(additional.map((x) => x)),
        "instrument": instrument == null ? null : instrument.toJson(),
        "payer": payer == null ? null : payer.toJson(),
        "buyer": buyer == null ? null : buyer.toJson(),
      };
}
