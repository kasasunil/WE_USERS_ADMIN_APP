// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) =>
    List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  Welcome({
    required this.name,
    required this.email,
    required this.isPremiumUser,
    required this.phone,
    required this.fbid,
  });

  String name;
  String email;
  String isPremiumUser;
  String phone;
  String fbid;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        name: json["name"],
        email: json["email"],
        isPremiumUser: json["isPremiumUser"],
        phone: json["phone"],
        fbid: json["fbid"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "isPremiumUser": isPremiumUser,
        "phone": phone,
        "fbid": fbid
      };
}
