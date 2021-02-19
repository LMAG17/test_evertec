// To parse this JSON data, do
//
//     final DocumentType = DocumentTypeFromJson(jsonString);

import 'dart:convert';

class DocumentType {
  DocumentType({
    this.name,
    this.value,
  });

  String name;
  String value;

  factory DocumentType.fromRawJson(String str) =>
      DocumentType.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DocumentType.fromJson(Map<String, dynamic> json) => DocumentType(
        name: json["name"] == null ? null : json["name"],
        value: json["value"] == null ? null : json["value"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "value": value == null ? null : value,
      };
}
