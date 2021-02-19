// To parse this JSON data, do
//
//     final payment = paymentFromJson(jsonString);

import 'dart:convert';

import 'package:test_evertec/Models/Basics/auth.dart';
import 'package:test_evertec/Models/Basics/instrument.dart';
import 'package:test_evertec/Models/Basics/payment.dart';

class ValidationOtpRequest {
  ValidationOtpRequest({
    this.auth,
    this.instrument,
    this.payment,
  });

  Auth auth;
  Instrument instrument;
  Payment payment;

  factory ValidationOtpRequest.fromRawJson(String str) =>
      ValidationOtpRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ValidationOtpRequest.fromJson(Map<String, dynamic> json) =>
      ValidationOtpRequest(
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
