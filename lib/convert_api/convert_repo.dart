import 'package:currency_app/convert_api/convert_model.dart';
import 'package:currency_app/convert_api/convert_params.dart';
import 'package:currency_app/utils/api/core/http_method.dart';
import 'package:currency_app/utils/api/implementation/riverpod_api/riverpod_api.dart';
import 'package:currency_app/utils/factory_utils.dart';
import 'package:currency_app/utils/urls.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'convert_repo.g.dart';

@Riverpod(keepAlive: true)
RiverpodAPI<ConvertModel, ConvertParams> convertRepo(ConvertRepoRef ref) {
  ConvertParams convertParams = ConvertParams();
  final toSym = convertParams.toSym;
  final fromSym = convertParams.fromSym;
  final amount = convertParams.amount;
  return RiverpodAPI<ConvertModel, ConvertParams>(
    completeUrl: URLs.complete("/convert?to={$toSym}&from={$fromSym}&amount={$amount}"),
    factory: FactoryUtils.modelFromString(ConvertModel.fromJson,showLog: true),
    params: convertParams,
    method: HTTPMethod.get,
    ref: ref,
  );
}