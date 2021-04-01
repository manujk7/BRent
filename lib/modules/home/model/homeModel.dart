// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  HomeModel({
    this.status,
    this.allFlight,
  });

  String status;
  List<AllFlight> allFlight;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        status: json["status"],
        allFlight: List<AllFlight>.from(
            json["allflight"].map((x) => AllFlight.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "allflight": List<dynamic>.from(allFlight.map((x) => x.toJson())),
      };
}

class AllFlight {
  AllFlight({
    this.id,
    this.userId,
    this.way,
    this.from,
    this.to,
    this.flightDate,
    this.timeOfDeparture,
    this.timeOfArrival,
    this.price,
    this.seats,
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
  String price;
  String seats;
  DateTime createdAt;
  DateTime updatedAt;

  factory AllFlight.fromJson(Map<String, dynamic> json) => AllFlight(
        id: json["id"],
        userId: json["user_id"],
        way: json["way"],
        from: json["from"],
        to: json["to"],
        flightDate: json["flight_date"],
        timeOfDeparture: json["time_of_departure"],
        timeOfArrival: json["time_of_arrival"],
        price: json["price"],
        seats: json["seats"],
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
        "price": price,
        "seats": seats,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
