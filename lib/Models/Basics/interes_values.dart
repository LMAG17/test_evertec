// To parse this JSON data, do
//
//     final InterestValues = InterestValuesFromJson(jsonString);

import 'dart:convert';

class InterestValues {
  InterestValues({
    this.original,
    this.installment,
    this.interest,
    this.total,
  });

  double original;
  double installment;
  double interest;
  double total;

  factory InterestValues.fromRawJson(String str) =>
      InterestValues.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory InterestValues.fromJson(Map<String, dynamic> json) => InterestValues(
        original: json["original"] == null ? null : json["original"].toDouble(),
        installment:
            json["installment"] == null ? null : json["installment"].toDouble(),
        interest: json["interest"] == null ? null : json["interest"].toDouble(),
        total: json["total"] == null ? null : json["total"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "original": original == null ? null : original,
        "installment": installment == null ? null : installment,
        "interest": interest == null ? null : interest,
        "total": total == null ? null : total,
      };
}
