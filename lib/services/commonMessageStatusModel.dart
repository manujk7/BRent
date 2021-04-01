// To parse this JSON data, do
//
//     final statusMessageModel = statusMessageModelFromJson(jsonString);

import 'dart:convert';

StatusMessageModel statusMessageModelFromJson(String str) => StatusMessageModel.fromJson(json.decode(str));

String statusMessageModelToJson(StatusMessageModel data) => json.encode(data.toJson());

class StatusMessageModel {
  StatusMessageModel({
    this.status,
    this.msg,
  });

  String status = "";
  String msg;

  factory StatusMessageModel.fromJson(Map<String, dynamic> json) => StatusMessageModel(
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
  };
}
