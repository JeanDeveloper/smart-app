import 'dart:convert';

import 'package:smart/domain/entities/general_person_doc.dart';

List<GeneralPersonDocModel> generalPersonDocModelFromJson(String str) => List<GeneralPersonDocModel>.from(json.decode(str).map((x) => GeneralPersonDocModel.fromJson(x)));

class GeneralPersonDocModel extends GeneralPersonDoc{
  GeneralPersonDocModel({
    required this.nroDoc,
    required this.cumplio,
    required this.fullname,
    required this.fechaEmision,
    required this.fechaCaducidad,
  }) : super(nroDoc: nroDoc, cumplio: cumplio, fullname: fullname, fechaEmision: fechaEmision, fechaCaducidad: fechaCaducidad) ;

  @override
  String nroDoc;
  @override
  bool cumplio;
  @override
  String fullname;
  @override
  String? fechaEmision;
  @override
  String? fechaCaducidad;

  factory GeneralPersonDocModel.fromJson(Map<String, dynamic> json) => GeneralPersonDocModel(
    nroDoc: json["nroDoc"],
    cumplio: json["cumplio"],
    fullname: json["fullname"],
    fechaEmision: json["fechaEmision"] == null ? null : json["fechaEmision"],
    fechaCaducidad: json["fechaCaducidad"] == null ? null : json["fechaCaducidad"],
  );

}
