// To parse this JSON data, do
//
//     final Instrument = InstrumentFromJson(jsonString);

import 'dart:convert';

class Credit {
  Credit({
    this.code,
    this.type,
    this.groupCode,
    this.installments,
    this.installment,
    this.description,
  });

  int code;
  String type;
  String groupCode;
  List<int> installments;
  int installment;
  String description;

  factory Credit.fromRawJson(String str) => Credit.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Credit.fromJson(Map<String, dynamic> json) => Credit(
        code: json["code"] == null ? null : json["code"],
        type: json["type"] == null ? null : json["type"],
        groupCode: json["groupCode"] == null ? null : json["groupCode"],
        installments: json["installments"] == null
            ? null
            : List<int>.from(json["installments"].map((x) => x)),
        installment: json["installment"] == null ? null : json["installment"],
        description: json["description"] == null ? null : json["description"],
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "type": type == null ? null : type,
        "groupCode": groupCode == null ? null : groupCode,
        "installments": installments == null
            ? null
            : List<dynamic>.from(installments.map((x) => x)),
        "installment": installment == null ? null : installment,
        "description": description == null ? null : description,
      };
}
