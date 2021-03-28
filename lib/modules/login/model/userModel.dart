// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String status;
  String msg;
  String authCode;
  Profile profile;

  UserModel({
    this.status,
    this.msg,
    this.authCode,
    this.profile,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    msg = json["msg"];
    if (status == "true") {
      authCode = json["auth_code"];
      profile = Profile.fromJson(json["profile"]);
    }
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "auth_code": authCode,
        "profile": profile.toJson(),
      };
}

class Profile {
  Profile(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.password,
      this.address,
      this.city,
      this.state,
      this.zipcode,
      this.referCode,
      this.createdAt,
      this.updatedAt,
      this.lastLogin,
      this.profilePic});

  String id;
  String name;
  String profilePic;
  String email;
  String phone;
  String password;
  String address;
  String city;
  String state;
  String zipcode;
  String referCode;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime lastLogin;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        name: json["name"],
        profilePic: json["profile_pic"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        zipcode: json["zipcode"],
        referCode: json["refer_code"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        lastLogin: DateTime.parse(json["last_login"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "profile_pic": profilePic,
        "email": email,
        "phone": phone,
        "password": password,
        "address": address,
        "city": city,
        "state": state,
        "zipcode": zipcode,
        "refer_code": referCode,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "last_login": lastLogin.toIso8601String(),
      };
}
