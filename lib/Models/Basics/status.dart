// To parse this JSON data, do
//
//     final status = statusFromJson(jsonString);

import 'dart:convert';

class Status {
  Status({
    this.status,
    this.reason,
    this.message,
    this.date,
  });

  String status;
  String reason;
  String message;
  String date;

  factory Status.fromRawJson(String str) => Status.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        status: json["status"] == null ? null : json["status"],
        reason: json["reason"] == null ? null : json["reason"],
        message: json["message"] == null ? null : json["message"],
        date: json["date"] == null ? null : json["date"],
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "reason": reason == null ? null : reason,
        "message": message == null ? null : message,
        "date": date == null ? null : date,
      };
}
