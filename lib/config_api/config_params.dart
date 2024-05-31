import '../utils/api/implementation/simple_api/simple_params.dart';

class ConfigParams extends SimpleParameters {
  // Map<String, String> _headers = {
  //   "apiKey": "ANaMY3OL22p2OXqHopXBFrhf3iZhh9bP",
  // };

  Map<String, String> get headers => super.headers;

  set header(Map<String, String> _headers) {
    super.headers = _headers;
  }
}