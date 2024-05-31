import 'package:currency_app/utils/api/implementation/simple_api/simple_params.dart';

class ConvertParams extends SimpleParameters {
  Map<String, String> get headers => super.headers;

  set header(Map<String, String> _headers) {
    super.headers = _headers;
  }

  String get fromSym => super.queryParams["fromSym"] ?? "";

  set fromSym(String val){
    super.queryParams["fromSym"] = val;
  }

  String get toSym => super.queryParams["toSym"] ?? "";

  set toSym(String val) {
    super.queryParams["toSym"] = val;
  }

  String get amount => (super.queryParams["amount"] ?? '0.0');

  set amount(String amount) {
    super.queryParams["amount"] = amount;
  }



}
