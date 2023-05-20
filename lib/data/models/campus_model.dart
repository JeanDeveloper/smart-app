
import 'dart:convert';

import 'package:smart/domain/entities/campus.dart';

List<CampusModel> campusModelFromJson(String str) => List<CampusModel>.from(json.decode(str).map((x) => CampusModel.fromJson(x)));

String campusModelToJson(List<CampusModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CampusModel extends Campus {
  int codigo;
  String subsede;

  CampusModel({
    required this.codigo,
    required this.subsede,
  }) : super(codigo: codigo, subsede: subsede);

  factory CampusModel.fromJson(Map<String, dynamic> json) => CampusModel(
    codigo: json["codigo"],
    subsede: json["subsede"],
  );

  Map<String, dynamic> toJson() => {
    "codigo": codigo,
    "subsede": subsede,
  };
}
