import 'dart:convert';

class Address {
  Address({
    this.street,
    this.city,
    this.state,
    this.postalCode,
    this.country,
    this.phone,
  });

  String street;
  String city;
  String state;
  String postalCode;
  String country;
  String phone;

  factory Address.fromRawJson(String str) => Address.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"] == null ? null : json["street"],
        city: json["city"] == null ? null : json["city"],
        state: json["state"] == null ? null : json["state"],
        postalCode: json["postalCode"] == null ? null : json["postalCode"],
        country: json["country"] == null ? null : json["country"],
        phone: json["phone"] == null ? null : json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "street": street == null ? null : street,
        "city": city == null ? null : city,
        "state": state == null ? null : state,
        "postalCode": postalCode == null ? null : postalCode,
        "country": country == null ? null : country,
        "phone": phone == null ? null : phone,
      };
}
