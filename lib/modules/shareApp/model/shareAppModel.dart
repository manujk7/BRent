// To parse this JSON data, do
//
//     final shareAppModel = shareAppModelFromJson(jsonString);

import 'dart:convert';

ShareAppModel shareAppModelFromJson(String str) => ShareAppModel.fromJson(json.decode(str));

String shareAppModelToJson(ShareAppModel data) => json.encode(data.toJson());

class ShareAppModel {
  ShareAppModel({
    this.status,
    this.code,
  });

  String status;
  int code;

  factory ShareAppModel.fromJson(Map<String, dynamic> json) => ShareAppModel(
    status: json["status"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
  };
}
