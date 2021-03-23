// To parse this JSON data, do
//
//     final currency = currencyFromJson(jsonString);

import 'dart:convert';

UserModel currencyFromJson(String str) => UserModel.fromJson(json.decode(str));

String currencyToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.rates,
    this.base,
    this.date,
  });

  Map<String, dynamic> rates;
  String base;
  DateTime date;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        rates: Map.from(json["rates"])
            .map((k, v) => MapEntry<String, dynamic>(k, v.toDouble())),
        base: json["base"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "rates": Map.from(rates).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "base": base,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
      };
}
