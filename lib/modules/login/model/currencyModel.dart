// To parse this JSON data, do
//
//     final currency = currencyFromJson(jsonString);

import 'dart:convert';

Currency currencyFromJson(String str) => Currency.fromJson(json.decode(str));

String currencyToJson(Currency data) => json.encode(data.toJson());

class Currency {
  Currency({
    this.rates,
    this.base,
    this.date,
  });

  Map<String, dynamic> rates;
  String base;
  DateTime date;

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
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
