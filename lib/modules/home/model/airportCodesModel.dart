// To parse this JSON data, do
//
//     final airportCodesModel = airportCodesModelFromJson(jsonString);

import 'dart:convert';

AirportCodesModel airportCodesModelFromJson(String str) => AirportCodesModel.fromJson(json.decode(str));

String airportCodesModelToJson(AirportCodesModel data) => json.encode(data.toJson());

class AirportCodesModel {
  AirportCodesModel({
    this.status,
    this.airport,
  });

  String status;
  List<Airport> airport;

  factory AirportCodesModel.fromJson(Map<String, dynamic> json) => AirportCodesModel(
    status: json["status"],
    airport: List<Airport>.from(json["airport"].map((x) => Airport.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "airport": List<dynamic>.from(airport.map((x) => x.toJson())),
  };
}

class Airport {
  Airport({
    this.id,
    this.fromTo,
    this.code,
  });

  String id;
  String fromTo;
  String code;

  factory Airport.fromJson(Map<String, dynamic> json) => Airport(
    id: json["id"],
    fromTo: json["fromto"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fromto": fromTo,
    "code": code,
  };
}
