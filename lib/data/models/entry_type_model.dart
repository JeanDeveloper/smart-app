import 'dart:convert';

import 'package:smart/domain/entities/entry_type.dart';

List<EntryTypeModel> entryTypeModelFromJson(String str) => List<EntryTypeModel>.from(json.decode(str).map((x) => EntryTypeModel.fromJson(x)));

String entryTypeModelToJson(List<EntryTypeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EntryTypeModel extends EntryType{
  int codigo;
  String descripcion;

  EntryTypeModel({
    required this.codigo,
    required this.descripcion,
  }) : super(codigo: codigo, descripcion: descripcion);

  factory EntryTypeModel.fromJson(Map<String, dynamic> json) => EntryTypeModel(
    codigo: json["codigo"],
    descripcion: json["descripcion"],
  );

  Map<String, dynamic> toJson() => {
    "codigo": codigo,
    "descripcion": descripcion,
  };
}
