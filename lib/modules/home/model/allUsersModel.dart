// To parse this JSON data, do
//
//     final allUsersModel = allUsersModelFromJson(jsonString);

import 'dart:convert';

AllUsersModel allUsersModelFromJson(String str) =>
    AllUsersModel.fromJson(json.decode(str));

String allUsersModelToJson(AllUsersModel data) => json.encode(data.toJson());

class AllUsersModel {
  AllUsersModel({
    this.status,
    this.allusers,
  });

  String status;
  List<AllUser> allusers;

  factory AllUsersModel.fromJson(Map<String, dynamic> json) => AllUsersModel(
        status: json["status"],
        allusers: List<AllUser>.from(
            json["allusers"].map((x) => AllUser.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "allusers": List<dynamic>.from(allusers.map((x) => x.toJson())),
      };
}

class AllUser {
  AllUser({
    this.profilePic,
    this.name,
    this.email,
    this.address,
    this.city,
    this.state,
    this.phone
  });

  String profilePic;
  String name;
  String email;
  String address;
  String city;
  String state;
  String phone;

  factory AllUser.fromJson(Map<String, dynamic> json) => AllUser(
        profilePic: json["profile_pic"],
        name: json["name"],
        email: json["email"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "profile_pic": profilePic,
        "name": name,
        "email": email,
        "address": address,
        "city": city,
        "state": state,
        "phone": phone,
      };
}
