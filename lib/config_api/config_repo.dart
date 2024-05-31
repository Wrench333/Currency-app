import 'dart:convert';
import 'package:currency_app/config_api/config_model.dart';
import 'package:currency_app/config_api/config_params.dart';
import 'package:currency_app/utils/api/core/http_method.dart';
import 'package:currency_app/utils/api/implementation/riverpod_api/riverpod_api.dart';
import 'package:currency_app/utils/factory_utils.dart';
import 'package:currency_app/utils/urls.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'config_repo.g.dart';

// @riverpod
// Future<List<Currency>> riverpodmodel(RiverpodmodelRef ref) async {
//   try {
//     final response = await http.get(
//         Uri.parse('https://api.apilayer.com/fixer/symbols'),
//         headers: {"apiKey": "ANaMY3OL22p2OXqHopXBFrhf3iZhh9bP"});
//     if(response.statusCode == 200) {
//       final Map<String, dynamic> data = json.decode(response.body);
//       print('$data');
//       List<Currency> currencyList = [];
//       for (int i = 0; i < data['symbols'].length(); i++) {
//         currencyList.add(Currency.fromJson(data, i));
//       }
//       return currencyList;
//     } else {
//       throw Exception(
//           'Failed to load list of currency symbols, status code: ${response
//               .statusCode}');
//     }
//
//   } on Exception catch (e) {
//     throw Exception('Failed to load list of currency symbols: $e');
//   }
// }

// @riverpod
// Future<double> convertamount(
//     ConvertamountRef ref, double amount, String toSym, String fromSym) async {
//   final response = await http.get(
//       Uri.https(
//           'https://api.apilayer.com/fixer/convert?to={$toSym}&from={$fromSym}&amount={$amount}'),
//       headers: {"apiKey": "ANaMY3OL22p2OXqHopXBFrhf3iZhh9bP"});
//   final json = jsonDecode(response.body) as Map<String,dynamic>;
//   return json['result'];
// }

@Riverpod(keepAlive: true)
RiverpodAPI<ConfigModel, ConfigParams> configRepo(ConfigRepoRef ref) {
  return RiverpodAPI<ConfigModel, ConfigParams>(
    completeUrl: URLs.complete("/symbols"),
    factory: FactoryUtils.modelFromString(ConfigModel.fromJson,showLog: true),
    params: ConfigParams(),
    method: HTTPMethod.get,
    ref: ref,
  );
}