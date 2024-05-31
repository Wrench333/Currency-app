// To parse this JSON data, do
//
//     final convertModel = convertModelFromJson(jsonString);

import 'dart:convert';

ConvertModel convertModelFromJson(String str) => ConvertModel.fromJson(json.decode(str));

String convertModelToJson(ConvertModel data) => json.encode(data.toJson());

class ConvertModel {
  DateTime? date;
  String? historical;
  Info? info;
  Query? query;
  double? result;
  bool? success;

  ConvertModel({
    this.date,
    this.historical,
    this.info,
    this.query,
    this.result,
    this.success,
  });

  ConvertModel copyWith({
    DateTime? date,
    String? historical,
    Info? info,
    Query? query,
    double? result,
    bool? success,
  }) =>
      ConvertModel(
        date: date ?? this.date,
        historical: historical ?? this.historical,
        info: info ?? this.info,
        query: query ?? this.query,
        result: result ?? this.result,
        success: success ?? this.success,
      );

  factory ConvertModel.fromJson(Map<String, dynamic> json) => ConvertModel(
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    historical: json["historical"],
    info: json["info"] == null ? null : Info.fromJson(json["info"]),
    query: json["query"] == null ? null : Query.fromJson(json["query"]),
    result: json["result"]?.toDouble(),
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "historical": historical,
    "info": info?.toJson(),
    "query": query?.toJson(),
    "result": result,
    "success": success,
  };
}

class Info {
  double? rate;
  int? timestamp;

  Info({
    this.rate,
    this.timestamp,
  });

  Info copyWith({
    double? rate,
    int? timestamp,
  }) =>
      Info(
        rate: rate ?? this.rate,
        timestamp: timestamp ?? this.timestamp,
      );

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    rate: json["rate"]?.toDouble(),
    timestamp: json["timestamp"],
  );

  Map<String, dynamic> toJson() => {
    "rate": rate,
    "timestamp": timestamp,
  };
}

class Query {
  int? amount;
  String? from;
  String? to;

  Query({
    this.amount,
    this.from,
    this.to,
  });

  Query copyWith({
    int? amount,
    String? from,
    String? to,
  }) =>
      Query(
        amount: amount ?? this.amount,
        from: from ?? this.from,
        to: to ?? this.to,
      );

  factory Query.fromJson(Map<String, dynamic> json) => Query(
    amount: json["amount"],
    from: json["from"],
    to: json["to"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "from": from,
    "to": to,
  };
}
