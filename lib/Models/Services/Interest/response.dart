// To parse this JSON data, do
//
//     final payment = paymentFromJson(jsonString);

import 'dart:convert';

import 'package:test_evertec/Models/Basics/amount_conversion.dart';
import 'package:test_evertec/Models/Basics/interes_values.dart';
import 'package:test_evertec/Models/Basics/status.dart';

class InterestResponse {
  InterestResponse({
    this.status,
    this.provider,
    this.values,
    this.conversion,
  });

  Status status;
  String provider;
  InterestValues values;
  AmountConversion conversion;

  factory InterestResponse.fromRawJson(String str) =>
      InterestResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory InterestResponse.fromJson(Map<String, dynamic> json) =>
      InterestResponse(
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        provider: json["provider"] == null ? null : json["provider"],
        values: json["values"] == null
            ? null
            : InterestValues.fromJson(json["values"]),
        conversion: json["conversion"] == null
            ? null
            : AmountConversion.fromJson(json["conversion"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status.toJson(),
        "provider": provider == null ? null : provider,
        "values": values == null ? null : values.toJson(),
        "conversion": conversion == null ? null : conversion.toJson(),
      };
}
