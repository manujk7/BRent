// To parse this JSON data, do
//
//     final createFlightModel = createFlightModelFromJson(jsonString);

import 'dart:convert';

CreateFlightModel createFlightModelFromJson(String str) =>
    CreateFlightModel.fromJson(json.decode(str));

String createFlightModelToJson(CreateFlightModel data) =>
    json.encode(data.toJson());

class CreateFlightModel {
  CreateFlightModel({
    this.status,
    this.msg,
    this.flight,
  });

  String status;
  String msg;
  Flight flight;

  factory CreateFlightModel.fromJson(Map<String, dynamic> json) =>
      CreateFlightModel(
        status: json["status"],
        msg: json["msg"],
        flight: Flight.fromJson(json["flight"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "flight": flight.toJson(),
      };
}

class Flight {
  Flight({
    this.id,
    this.userId,
    this.way,
    this.from,
    this.to,
    this.flightDate,
    this.timeOfDeparture,
    this.timeOfArrival,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String userId;
  String way;
  String from;
  String to;
  String flightDate;
  String timeOfDeparture;
  String timeOfArrival;
  DateTime createdAt;
  DateTime updatedAt;

  factory Flight.fromJson(Map<String, dynamic> json) => Flight(
        id: json["id"],
        userId: json["user_id"],
        way: json["way"],
        from: json["from"],
        to: json["to"],
        flightDate: json["flight_date"],
        timeOfDeparture: json["time_of_departure"],
        timeOfArrival: json["time_of_arrival"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "way": way,
        "from": from,
        "to": to,
        "flight_date": flightDate,
        "time_of_departure": timeOfDeparture,
        "time_of_arrival": timeOfArrival,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
