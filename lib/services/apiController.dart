import 'dart:convert';

import 'package:brent/modules/login/model/currencyModel.dart';
import 'package:get/get.dart';

class ApiController extends GetConnect {
  final baseUrl = "http://gendeep.com/dev/brent/Data_v1/";

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
//
//   /// API call to register
//   Future<UserModel> getCurrencyValues(
//       String base, List<String> compares) async {
//     var response = await get("base=$base&symbols=$currencies");
//     if (response.status.hasError) {
//       return Future.error(response.statusText);
//     } else {
//       var data = response.body;
//       print(data.toString());
//       var result = jsonEncode(data);
//       return currencyFromJson(result.toString());
//     }
//   }
}
