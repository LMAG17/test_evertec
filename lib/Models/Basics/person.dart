// To parse this JSON data, do
//
//     final payment = paymentFromJson(jsonString);

import 'dart:convert';

import 'package:test_evertec/Models/Basics/address.dart';

class Person {
  Person({
    this.documentType,
    this.document,
    this.name,
    this.surname,
    this.company,
    this.email,
    this.address,
    this.mobile,
  });

  String documentType;
  String document;
  String name;
  String surname;
  String company;
  String email;
  Address address;
  String mobile;

  factory Person.fromRawJson(String str) => Person.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        documentType:
            json["documentType"] == null ? null : json["documentType"],
        document: json["document"] == null ? null : json["document"],
        name: json["name"] == null ? null : json["name"],
        surname: json["surname"] == null ? null : json["surname"],
        company: json["company"] == null ? null : json["company"],
        email: json["email"] == null ? null : json["email"],
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        mobile: json["mobile"] == null ? null : json["mobile"],
      );

  Map<String, dynamic> toJson() => {
        "documentType": documentType == null ? null : documentType,
        "document": document == null ? null : document,
        "name": name == null ? null : name,
        "surname": surname == null ? null : surname,
        "company": company == null ? null : company,
        "email": email == null ? null : email,
        "address": address == null ? null : address.toJson(),
        "mobile": mobile == null ? null : mobile,
      };
}
