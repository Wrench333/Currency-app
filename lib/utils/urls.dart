class URLs {
  static const String serverUrl = "https://api.apilayer.com/fixer";

  static String complete(String local) {
    return serverUrl + local;
  }
}
