// To parse this JSON data, do
//
//     final configModel = configModelFromJson(jsonString);

import 'dart:convert';

ConfigModel configModelFromJson(String str) => ConfigModel.fromJson(json.decode(str));

String configModelToJson(ConfigModel data) => json.encode(data.toJson());

class ConfigModel {
  bool? success;
  Map<String, String>? symbols;

  ConfigModel({
    this.success,
    this.symbols,
  });

  ConfigModel copyWith({
    bool? success,
    Map<String, String>? symbols,
  }) =>
      ConfigModel(
        success: success ?? this.success,
        symbols: symbols ?? this.symbols,
      );

  factory ConfigModel.fromJson(Map<String, dynamic> json) => ConfigModel(
    success: json["success"],
    symbols: Map.from(json["symbols"]!).map((k, v) => MapEntry<String, String>(k, v)),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "symbols": Map.from(symbols!).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}