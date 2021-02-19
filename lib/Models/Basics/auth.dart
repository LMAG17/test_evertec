import 'dart:convert';

class Auth {
  Auth({
    this.login,
    this.tranKey,
    this.nonce,
    this.seed,
  });

  String login;
  String tranKey;
  String nonce;
  String seed;

  factory Auth.fromRawJson(String str) => Auth.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        login: json["login"] == null ? null : json["login"],
        tranKey: json["tranKey"] == null ? null : json["tranKey"],
        nonce: json["nonce"] == null ? null : json["nonce"],
        seed: json["seed"] == null ? null : json["seed"],
      );

  Map<String, dynamic> toJson() => {
        "login": login == null ? null : login,
        "tranKey": tranKey == null ? null : tranKey,
        "nonce": nonce == null ? null : nonce,
        "seed": seed == null ? null : seed,
      };
}
