import 'dart:convert';

import 'package:get/get.dart';

class ApiController extends GetConnect {
  final baseUrl = "https://api.exchangeratesapi.io/latest?";

  /// API call to get currency conversion
  // Future<Currency> getCurrencyValues(String base, List<String> compares) async {
  //   String currencies = compares.join(',');
  //   print("CURR: $currencies");
  //   var response = await get("base=$base&symbols=$currencies");
  //   if (response.status.hasError) {
  //     return Future.error(response.statusText);
  //   } else {
  //     var data = response.body;
  //     print(data.toString());
  //     var result = jsonEncode(data);
  //     return currencyFromJson(result.toString());
  //   }
  // }
}
