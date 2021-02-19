// To parse this JSON data, do
//
//     final Instrument = InstrumentFromJson(jsonString);

import 'dart:convert';

class Card {
  Card({
    this.number,
    this.expirationMonth,
    this.expirationYear,
    this.cvv,
  });

  String number;
  String expirationMonth;
  String expirationYear;
  String cvv;

  factory Card.fromRawJson(String str) => Card.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Card.fromJson(Map<String, dynamic> json) => Card(
        number: json["number"] == null ? null : json["number"],
        expirationMonth:
            json["expirationMonth"] == null ? null : json["expirationMonth"],
        expirationYear:
            json["expirationYear"] == null ? null : json["expirationYear"],
        cvv: json["cvv"] == null ? null : json["cvv"],
      );

  Map<String, dynamic> toJson() => {
        "number": number == null ? null : number,
        "expirationMonth": expirationMonth == null ? null : expirationMonth,
        "expirationYear": expirationYear == null ? null : expirationYear,
        "cvv": cvv == null ? null : cvv,
      };
}
