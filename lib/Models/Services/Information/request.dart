// To parse this JSON data, do
//
//     final payment = paymentFromJson(jsonString);

import 'dart:convert';

import 'package:test_evertec/Models/Basics/auth.dart';
import 'package:test_evertec/Models/Basics/instrument.dart';
import 'package:test_evertec/Models/Basics/payment.dart';

class InformationRequest {
  InformationRequest({
    this.auth,
    this.instrument,
    this.payment,
  });

  Auth auth;
  Instrument instrument;
  Payment payment;

  factory InformationRequest.fromRawJson(String str) =>
      InformationRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory InformationRequest.fromJson(Map<String, dynamic> json) =>
      InformationRequest(
        auth: json["auth"] == null ? null : Auth.fromJson(json["auth"]),
        instrument: json["instrument"] == null
            ? null
            : Instrument.fromJson(json["instrument"]),
        payment:
            json["payment"] == null ? null : Payment.fromJson(json["payment"]),
      );

  Map<String, dynamic> toJson() => {
        "auth": auth == null ? null : auth.toJson(),
        "instrument": instrument == null ? null : instrument.toJson(),
        "payment": payment == null ? null : payment.toJson(),
      };
}
