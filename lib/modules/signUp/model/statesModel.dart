// To parse this JSON data, do
//
//     final statesModel = statesModelFromJson(jsonString);

import 'dart:convert';

StatesModel statesModelFromJson(String str) =>
    StatesModel.fromJson(json.decode(str));

String statesModelToJson(StatesModel data) => json.encode(data.toJson());

class StatesModel {
  StatesModel({
    this.status,
    this.state,
  });

  String status;
  List<States> state;

  factory StatesModel.fromJson(Map<String, dynamic> json) => StatesModel(
        status: json["status"],
        state: List<States>.from(json["state"].map((x) => States.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "state": List<dynamic>.from(state.map((x) => x.toJson())),
      };
}

class States {
  States({
    this.id,
    this.name,
    this.code,
  });

  String id;
  String name;
  String code;

  factory States.fromJson(Map<String, dynamic> json) => States(
        id: json["id"],
        name: json["name"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
      };
}
