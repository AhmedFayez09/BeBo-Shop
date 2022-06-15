// To parse this JSON data, do
//
//     final productModels = productModelsFromJson(jsonString);

import 'dart:convert';

List<String> productModelsFromJson(String str) =>
    List<String>.from(json.decode(str).map((x) => x));

String productModelsToJson(List<String> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x)));
